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

      addStyle: ({ }) => {
        view.addStyle(params.sel, params.style);
        view.render();
      },

      setStyle: (params) => {
        view.setStyle(params.sel, params.style);
        view.render();
      }

    };
  }
});