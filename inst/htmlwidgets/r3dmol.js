HTMLWidgets.widget({

  name: 'r3dmol',

  type: 'output',

  factory: (el, width, height) => {

    // TODO: define shared variables for this instance

    return {

      renderValue: x => {
        $(el).empty();
        $(el).css({
          width: x.width || "100%",
          height: x.height || "500px",
          position: x.position || "relative",
        })
        const config = {
          backgroundColor: 'white',
        };
        let v = $3Dmol.createViewer($(el), config);
        v.addModel(x.data.join("\n"), "pdb");
        v.setStyle({}, { cartoon: { color: 'spectrum' } });
        v.zoomTo();
        v.render();
      },

      resize: (width, height) => {

        // TODO: code to re-render the widget with a new size

      }

    };
  }
});