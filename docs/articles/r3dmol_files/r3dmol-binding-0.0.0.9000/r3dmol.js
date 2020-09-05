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
          view.render();
        }

        // Now that the widget is initialized, call any outstanding API
        // functions that the user wantd to run on the widget
        const numApiCalls = x['api'].length;
        console.log(x);
        for (let i = 0; i < numApiCalls; i++) {
          let call = x['api'][i];
          const method = call.method;
          delete call['method'];
          try {
            that[method](call);
          } catch (err) { }
        }
      },

      resize: (width, height) => {

        // TODO: code to re-render the widget with a new size

      },

      addArrow: params => {
        view.addArrow(params.spec);
        view.render();
      },

      addAsOneMolecule: params => {
        view.addAsOneMolecule(params.data.join("\n"), params.format);
        view.render();
      },

      addBox: params => {
        view.addBox(params.spec);
        view.render();
      },

      addCurve: params => {
        view.addCurve(params.spec);
        view.render();
      },

      addStyle: (params) => {
        view.addStyle(params.sel, params.style);
        view.render();
      },

      setStyle: (params) => {
        view.setStyle(params.sel, params.style);
        view.render();
      },

      isAnimated: ({ }) => {
        return view.isAnimated();
      },

      setBackgroundColor: (params) => {
        view.setBackgroundColor(params.hex, params.alpha);
        view.render();
      },

      spin: (params) => {
        view.spin(params.axis);
        view.render();
      },

      setWidth: (params) => {
        view.setWidth(params.width);
        view.render();
      },

      setZoomLimits: (params) => {
        view.setZoomLimits(params.lower, params.upper);
        view.render();
      },

      stopAnimate: ({ }) => { // TODO: not working.
        view.stopAnimate();
        view.render();
      },

      translate: (params) => {
        view.translate(params.x, params.y, params.animationDuration, params.fixedPath);
        view.render();
      },

      translateScene: (params) => { // TODO: need test.
        view.translateScene(params.x, params.y, params.animationDuration, params.fixedPath);
        view.render();
      },

      zoom: (params) => {
        view.zoom(params.factor, params.animationDuration, params.fixedPath);
        view.render();
      },
    };
  }
});