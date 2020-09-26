const isAutoRenderFunction = [
  // Other
  "createModelFrom",
  // add
  "addArrow", "addBox", "addCurve", "addCylinder", "addLine",
  "addSphere", "addShape", "addStyle", "addLabel", "addModel",
  "addVolumetricData", "addPropertyLabels", "addResLabels",
  "addSurface", "addUnitCell", "addCustom", "addModels", "addIsosurface",
  "replicateUnitCell", "addModelsAsFrames", "addVolumetricRender",
  // set
  "setStyle", "setBackgroundColor", "setWidth", "setProjection",
  "setZoomLimits", "setHeight", "setSlab", "setViewStyle", "resize_m",
  "setHoverDuration", "setColorByElement", "setPerceivedDistance",
  "setView",
  // get
  "getModel",
  // remove
  "removeAllLabels", "removeAllModels", "removeAllShapes",
  "removeAllSurfaces", "removeLabel", "removeUnitCell",
  // animate
  "spin", "rotate", "translate", "translateScene", "zoom", "zoomTo",
  "enableFog", "center", "vibrate"
];

HTMLWidgets.widget({

  name: 'r3dmol',

  type: 'output',

  factory: (el, width, height) => {

    let initialized = false;
    const elementId = el.id;
    const container = document.getElementById(elementId);
    let view;

    const evalCallback = (callbackArray, paramSet) => {
      while (callbackArray.length) {
        let name = callbackArray.shift();
        paramSet[name] = eval('(' + paramSet[name] + ')');
      }
      return (paramSet);
    }

    return {

      renderValue: function (x) {
        // alias this
        const that = this;
        if (!initialized) {
          initialized = true;
          // attach the widget to the DOM
          container.widget = that;

          $(el).css({
            position: x.position || "relative",
          });
          view = $3Dmol.createViewer($(container), x.configs);

          // set listeners to events and pass data back to Shiny
          // if (HTMLWidgets.shinyMode) {
          //   Shiny.onInputChange(
          //     elementId + "_selected",
          //     console.log(elementId)
          //   );
          // }
        }
        // Now that the widget is initialized, call any outstanding API
        // functions that the user wantd to run on the widget
        const numApiCalls = x.api.length;
        // Save last call function name for auto render function call
        const lastCallFunction = x.api[numApiCalls - 1].method;

        for (let i = 0; i < numApiCalls; i++) {
          let call = x.api[i];
          const method = call.method;
          delete call.method;
          try {
            that[method](call);
          } catch (err) { }
        }
        // Auto render
        if (isAutoRenderFunction.findIndex(el => el === lastCallFunction) > -1) {
          view.render();
        }
      },

      resize: (width, height) => {
        container.setAttribute('width', width);
        container.setAttribute('height', height);
      },
      render: () => view.render(),
      rotate: params => view.rotate(params.angle, params.axis, params.animationDuration, params.fixedPath),
      createModelFrom: params => view.createModelFrom(params.sel, params.extract),
      addArrow: params => view.addArrow(evalCallback(['callback'], params.spec)),
      addAsOneMolecule: params => view.addAsOneMolecule(params.data, params.format),
      addBox: params => view.addBox(params.spec),
      addCurve: params => view.addCurve(params.spec),
      addCustom: params => view.addCustom(params.spec),
      addCylinder: params => view.addCylinder(evalCallback(['callback', 'hover_callback', 'unhover_callback'], params.spec)),
      addLabel: params => view.addLabel(params.text, params.options, params.sel, params.noshow),
      addLine: params => view.addLine(params.spec),
      addPropertyLabels: params => view.addPropertyLabels(params.prop, params.sel, params.style),
      addResLabels: params => view.addResLabels(params.sel, params.style, params.byframe),
      addSphere: params => view.addSphere(params.spec),
      addShape: params => view.addShape(params.shapeSpec),
      addStyle: params => view.addStyle(params.sel, params.style),
      addModel: params => view.addModel(params.data[0].toString(), params.format, params.options),
      addModels: params => view.addModels(params.data.toString(), params.format),
      addUnitCell: params => view.addUnitCell(params.model, params.spec),
      // TODO: not working
      addVolumetricRender: params => view.addVolumetricRender(new $3Dmol.VolumeData(params.data.toString(), "cube"), params.spec),
      addModelsAsFrames: params => view.addModelsAsFrames(params.data, params.format),
      addIsosurface: params => view.addIsosurface(new $3Dmol.VolumeData(params.data.toString(), "cube"), params.isoSpec),
      // TODO: not working
      addSurface: params => view.addSurface(params.type, params.style, params.atomsel, params.allsel, params.focus, evalCallback(['surfacecallback'], params.surfacecallback)),
      removeAllLabels: () => view.removeAllLabels(),
      removeAllModels: () => view.removeAllModels(),
      removeAllShapes: () => view.removeAllShapes(),
      removeAllSurfaces: () => view.removeAllSurfaces(),
      removeLabel: () => view.removeLabel(),
      removeUnitCell: params => view.removeUnitCell(params.model),
      replicateUnitCell: params => view.replicateUnitCell(params.a, params.b, params.c, params.model),
      setStyle: params => view.setStyle(params.sel, params.style),
      isAnimated: () => {
        return view.isAnimated();
      },
      setBackgroundColor: params => view.setBackgroundColor(params.hex, params.alpha),
      setPerceivedDistance: params => view.setPerceivedDistance(params.dist),
      setColorByElement: params => view.setColorByElement(params.sel, params.colors),
      setSlab: params => view.setSlab(params.near, params.far),
      setViewStyle: params => view.setViewStyle(params.style),
      setView: params => view.setView(params.arg),
      setHoverDuration: params => view.setHoverDuration(params.hoverDuration),
      spin: params => view.spin(params.axis),
      setWidth: params => view.setWidth(params.width),
      setHeight: params => view.setHeight(params.height),
      setProjection: params => view.setProjection(params.scheme),
      setZoomLimits: params => view.setZoomLimits(params.lower, params.upper),
      setDefaultCartoonQuality: params => view.setDefaultCartoonQuality(params.quality),
      // TODO: not working.
      getModel: params => view.getModel(params.modelId),
      stopAnimate: () => view.stopAnimate(),
      animate: params => view.animate(params.options),
      enableFog: params => view.enableFog(params.fog),
      translate: params => view.translate(params.x, params.y, params.animationDuration, params.fixedPath),
      translateScene: params => view.translateScene(params.x, params.y, params.animationDuration, params.fixedPath),
      zoom: params => view.zoom(params.factor, params.animationDuration, params.fixedPath),
      zoomTo: params => view.zoomTo(params.sel, params.animationDuration, params.fixedPath),
      vibrate: params => view.vibrate(params.numFrames, params.amplitude, params.bothWays, params.arrowSpec),
      center: params => view.center(params.sel, params.animationDuration, params.fixedPath),
    };
  }
});

// Attach message handlers if in shiny mode (these correspond to API)
if (HTMLWidgets.shinyMode) {
  const addShinyHandler = (fxn) => {
    return () => {
      Shiny.addCustomMessageHandler(
        "r3dmol:" + fxn, (message) => {
          const el = document.getElementById(message.id);
          if (el) {
            delete message['id'];
            el.widget[fxn](message);
            if (isAutoRenderFunction.findIndex(el => el === fxn) > -1) {
              el.widget.render();
            }
          }
        }
      );
    }
  };

  for (let i = 0; i < isAutoRenderFunction.length; i++) {
    addShinyHandler(isAutoRenderFunction[i])();
  }
}