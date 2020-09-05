HTMLWidgets.widget({

  name: 'r3dmol',

  type: 'output',

  factory: (el, width, height) => {

    let initialized = false;
    const elementId = el.id;
    const container = document.getElementById(elementId);
    let view = $3Dmol.createViewer($(container), { backgroundColor: 'white' });

    return {

      renderValue: function (x) {
        // alias this
        const that = this;
        if (!initialized) {
          initialized = true;
          // attach the widget to the DOM
          container.widget = that;

          $(el).css({
            width: x.width || "100%",
            height: x.height || "500px",
            position: x.position || "relative",
          })
          view.addModel(x.data.join("\n"), "pdb");
          view.zoomTo();
        }

        // Now that the widget is initialized, call any outstanding API
        // functions that the user wantd to run on the widget
        const numApiCalls = x['api'].length;
        // Save last call function name for auto render function call
        const lastCallFunction = x['api'][numApiCalls - 1].method;
        const isAutoRenderFunction = [
          "addArrow", "addBox", "addCurve", "addCylinder", "addLine",
          "addSphere", "addShape", "addStyle",
          "setStyle", "setBackgroundColor", "setWidth", "setProjection",
          "setZoomLimits",
          "spin", "translate", "translateScene", "zoom"
        ]

        for (let i = 0; i < numApiCalls; i++) {
          let call = x['api'][i];
          const method = call.method;
          delete call['method'];
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

        // TODO: code to re-render the widget with a new size

      },
      render: () => {
        view.render();
      },

      addArrow: params => {
        view.addArrow(params.spec);
      },

      addAsOneMolecule: params => {
        view.addAsOneMolecule(params.data.join("\n"), params.format);
      },

      addBox: params => {
        view.addBox(params.spec);
      },

      addCurve: params => {
        view.addCurve(params.spec);
      },

      addCylinder: params => {
        view.addCylinder(params.spec);
      },

      addLine: params => {
        view.addLine(params.spec);
      },

      addPropertyLabels: (params) => {
        view.addPropertyLabels(params.prop, params.sel, params.style);
      },

      addSphere: params => {
        view.addSphere(params.spec);
      },

      addShape: params => {
        view.addShape(params.shapeSpec);
      },

      addStyle: (params) => {
        view.addStyle(params.sel, params.style);
      },

      setStyle: (params) => {
        view.setStyle(params.sel, params.style);
      },

      isAnimated: ({ }) => {
        return view.isAnimated();
      },

      setBackgroundColor: (params) => {
        view.setBackgroundColor(params.hex, params.alpha);
      },

      spin: (params) => {
        view.spin(params.axis);
      },

      setWidth: (params) => {
        view.setWidth(params.width);
      },

      setProjection: params => {
        view.setProjection(params.scheme)
      },

      setZoomLimits: (params) => {
        view.setZoomLimits(params.lower, params.upper);
      },

      stopAnimate: ({ }) => { // TODO: not working.
        view.stopAnimate();
      },

      translate: (params) => {
        view.translate(params.x, params.y, params.animationDuration, params.fixedPath);
      },

      translateScene: (params) => { // TODO: need test.
        view.translateScene(params.x, params.y, params.animationDuration, params.fixedPath);
      },

      zoom: (params) => {
        view.zoom(params.factor, params.animationDuration, params.fixedPath);
      },
    };
  }
});