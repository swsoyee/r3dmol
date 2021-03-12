/* global $ HTMLWidgets $3Dmol Shiny */
const isAutoRenderFunction = [
  // Other
  'createModelFrom', 'button',
  // add
  'addArrow', 'addBox', 'addCurve', 'addCylinder', 'addLine',
  'addSphere', 'addShape', 'addStyle', 'addLabel', 'addModel',
  'addVolumetricData', 'addPropertyLabels', 'addResLabels',
  'addSurface', 'addUnitCell', 'addCustom', 'addModels', 'addIsosurface',
  'replicateUnitCell', 'addModelsAsFrames', 'addVolumetricRender',
  // set
  'setStyle', 'setBackgroundColor', 'setWidth', 'setProjection',
  'setZoomLimits', 'setHeight', 'setSlab', 'setViewStyle', 'resize_m',
  'setHoverDuration', 'setColorByElement', 'setPerceivedDistance',
  'setView',
  // get
  'getModel',
  // remove
  'removeAllLabels', 'removeAllModels', 'removeAllShapes',
  'removeAllSurfaces', 'removeLabel', 'removeUnitCell',
  // animate
  'spin', 'rotate', 'translate', 'translateScene', 'zoom', 'zoomTo',
  'enableFog', 'center', 'vibrate',
];

HTMLWidgets.widget({

  name: 'r3dmol',

  type: 'output',

  factory: (el) => {
    let initialized = false;
    const elementId = el.id;
    const container = document.getElementById(elementId);
    let viewer;

    const evalFun = (object) => {
      Object.keys(object).forEach((key) => {
        if (object[key] !== null && typeof object[key] === 'object') {
          evalFun(object[key]);
          return;
        }
        if (object[key].toString().match('function') != null) {
          object[key] = eval(`(${object[key]})`);
        }
      });
    };

    return {

      renderValue(x) {
        // alias this
        const that = this;

        if (x.viewer) {
          viewer = x.viewer;
        }

        if (!initialized) {
          initialized = true;
          // attach the widget to the DOM
          container.widget = that;

          $(el).css({
            position: x.position || 'relative',
          });
          if (x.api === 'grid') {
            const viewers = $3Dmol.createViewerGrid($(container), x.configs, x.viewer_config);
            let index = 0;
            for (let i = 0; i < x.configs.rows; i += 1) {
              for (let j = 0; j < x.configs.cols; j += 1) {
                x.viewer[index].x.viewer = viewers[i][j];
                that.renderValue(x.viewer[index].x);
                index += 1;
              }
            }
          }
          if (x.viewer) {
            viewer = x.viewer;
          } else {
            viewer = $3Dmol.createViewer($(container), x.configs);
          }
        }
        // set listeners to events and pass data back to Shiny
        if (HTMLWidgets.shinyMode) {
          viewer.clear();
          viewer.setStateChangeCallback(() => {
            // Shiny.onInputChange(elementId + "_is_animated", view.isAnimated());
            Shiny.onInputChange(`${elementId}_get_perceived_distance`, viewer.getPerceivedDistance());
          });
        }
        // Now that the widget is initialized, call any outstanding API
        // functions that the user wantd to run on the widget
        const numApiCalls = x.api.length;
        // Save last call function name for auto render function call
        const lastCallFunction = x.api[numApiCalls - 1].method;

        for (let i = 0; i < numApiCalls; i += 1) {
          const call = x.api[i];
          const { method } = call;
          delete call.method;
          try {
            evalFun(call);
            that[method](call);
          } catch (err) {
            // continue regardless of error
          }
        }
        // Auto render
        if (isAutoRenderFunction.findIndex((element) => element === lastCallFunction) > -1) {
          if (x.viewer) {
            x.viewer.render();
          } else {
            viewer.render();
          }
        }
      },

      resize: (newWidth, newHeight) => {
        container.setAttribute('width', newWidth);
        container.setAttribute('height', newHeight);
      },
      render: () => viewer.render(),
      rotate: (params) => viewer.rotate(params.angle, params.axis, params.animationDuration, params.fixedPath),
      createModelFrom: (params) => viewer.createModelFrom(params.sel, params.extract),
      addArrow: (params) => viewer.addArrow(params.spec),
      addAsOneMolecule: (params) => viewer.addAsOneMolecule(params.data, params.format),
      addBox: (params) => viewer.addBox(params.spec),
      addCurve: (params) => viewer.addCurve(params.spec),
      addCustom: (params) => viewer.addCustom(params.spec),
      addCylinder: (params) => viewer.addCylinder(params.spec),
      addLabel: (params) => viewer.addLabel(params.text, params.options, params.sel, params.noshow),
      addLine: (params) => viewer.addLine(params.spec),
      addPropertyLabels: (params) => viewer.addPropertyLabels(params.prop, params.sel, params.style),
      addResLabels: (params) => viewer.addResLabels(params.sel, params.style, params.byframe),
      addSphere: (params) => viewer.addSphere(params.spec),
      addShape: (params) => viewer.addShape(params.shapeSpec),
      addStyle: (params) => viewer.addStyle(params.sel, params.style),
      addModel: (params) => viewer.addModel(params.data[0].toString(), params.format, params.options),
      addModels: (params) => viewer.addModels(params.data.toString(), params.format),
      addUnitCell: (params) => viewer.addUnitCell(params.model, params.spec),
      // TODO: not working
      addVolumetricRender: (params) => viewer.addVolumetricRender(new $3Dmol.VolumeData(params.data.toString(), 'cube'), params.spec),
      addModelsAsFrames: (params) => viewer.addModelsAsFrames(params.data, params.format),
      addIsosurface: (params) => viewer.addIsosurface(new $3Dmol.VolumeData(params.data.toString(), 'cube'), params.isoSpec),
      // TODO: not working
      addSurface: (params) => viewer.addSurface(params.type, params.style, params.atomsel, params.allsel, params.focus, params.surfacecallback),
      removeAllLabels: () => viewer.removeAllLabels(),
      removeAllModels: () => viewer.removeAllModels(),
      removeAllShapes: () => viewer.removeAllShapes(),
      removeAllSurfaces: () => viewer.removeAllSurfaces(),
      removeLabel: () => viewer.removeLabel(),
      removeUnitCell: (params) => viewer.removeUnitCell(params.model),
      replicateUnitCell: (params) => viewer.replicateUnitCell(params.a, params.b, params.c, params.model),
      setStyle: (params) => viewer.setStyle(params.sel, params.style),
      setBackgroundColor: (params) => viewer.setBackgroundColor(params.hex, params.alpha),
      setPerceivedDistance: (params) => viewer.setPerceivedDistance(params.dist),
      setColorByElement: (params) => viewer.setColorByElement(params.sel, params.colors),
      setSlab: (params) => viewer.setSlab(params.near, params.far),
      setViewStyle: (params) => viewer.setViewStyle(params.style),
      setView: (params) => viewer.setView(params.arg),
      setHoverDuration: (params) => viewer.setHoverDuration(params.hoverDuration),
      spin: (params) => viewer.spin(params.axis, params.speed),
      setWidth: (params) => viewer.setWidth(params.width),
      setHeight: (params) => viewer.setHeight(params.height),
      setProjection: (params) => viewer.setProjection(params.scheme),
      setZoomLimits: (params) => viewer.setZoomLimits(params.lower, params.upper),
      setDefaultCartoonQuality: (params) => viewer.setDefaultCartoonQuality(params.quality),
      // TODO: not working.
      isAnimated: () => viewer.isAnimated(),
      // TODO: not working.
      getModel: (params) => viewer.getModel(params.modelId),
      stopAnimate: () => viewer.stopAnimate(),
      animate: (params) => viewer.animate(params.options),
      enableFog: (params) => viewer.enableFog(params.fog),
      translate: (params) => viewer.translate(params.x, params.y, params.animationDuration, params.fixedPath),
      translateScene: (params) => viewer.translateScene(params.x, params.y, params.animationDuration, params.fixedPath),
      zoom: (params) => viewer.zoom(params.factor, params.animationDuration, params.fixedPath),
      zoomTo: (params) => viewer.zoomTo(params.sel, params.animationDuration, params.fixedPath),
      vibrate: (params) => viewer.vibrate(params.numFrames, params.amplitude, params.bothWays, params.arrowSpec),
      center: (params) => viewer.center(params.sel, params.animationDuration, params.fixedPath),
      clear: () => viewer.clear(),
      pngURI: (params) => {
        viewer.render();
        container.innerHTML = `<img src="${viewer.pngURI()}" width="${params.width}" height="${params.height}"/>`;
      },
      button: (params) => {
        const parent = container.parentElement;
        let buttonLayout = parent.querySelector('#button-layout');
        if (buttonLayout === null) {
          const newButtonLayout = document.createElement('div');
          newButtonLayout.setAttribute('id', 'button-layout');
          const style = 'width:100%;height:100%;position:absolute;top:0;left:0;z-index:1;display:flex;';
          newButtonLayout.setAttribute('style', `${style}justify-content:${params.justify_content};align-items:${params.align_items};`);
          parent.insertBefore(newButtonLayout, parent.firstChild);
          buttonLayout = newButtonLayout;
        }
        const button = document.createElement('button');
        button.setAttribute('name', params.name);
        button.onclick = params.func;
        button.innerText = params.label;
        buttonLayout.append(button);
      },
    };
  },
});

// Attach message handlers if in shiny mode (these correspond to API)
if (HTMLWidgets.shinyMode) {
  const functionList = [
    // Other
    'createModelFrom', 'clear', 'isAnimated',
    // add
    'addArrow', 'addBox', 'addCurve', 'addCylinder', 'addLine',
    'addSphere', 'addShape', 'addStyle', 'addLabel', 'addModel',
    'addVolumetricData', 'addPropertyLabels', 'addResLabels',
    'addSurface', 'addUnitCell', 'addCustom', 'addModels', 'addIsosurface',
    'replicateUnitCell', 'addModelsAsFrames', 'addVolumetricRender',
    // set
    'setStyle', 'setBackgroundColor', 'setWidth', 'setProjection',
    'setZoomLimits', 'setHeight', 'setSlab', 'setViewStyle', 'resize_m',
    'setHoverDuration', 'setColorByElement', 'setPerceivedDistance',
    'setView',
    // get
    'getModel', 'getPerceivedDistance',
    // remove
    'removeAllLabels', 'removeAllModels', 'removeAllShapes',
    'removeAllSurfaces', 'removeLabel', 'removeUnitCell',
    // animate
    'spin', 'rotate', 'translate', 'translateScene', 'zoom', 'zoomTo',
    'enableFog', 'center', 'vibrate', 'stopAnimate', 'animate',
  ];
  const addShinyHandler = (fxn) => () => {
    Shiny.addCustomMessageHandler(
      `r3dmol:${fxn}`, (message) => {
        const el = document.getElementById(message.id);
        if (el && el.widget) {
          delete message.id;
          el.widget[fxn](message);
          if (isAutoRenderFunction.findIndex((ele) => ele === fxn) > -1) {
            el.widget.render();
          }
        }
      },
    );
  };

  for (let i = 0; i < functionList.length; i += 1) {
    addShinyHandler(functionList[i])();
  }
}
