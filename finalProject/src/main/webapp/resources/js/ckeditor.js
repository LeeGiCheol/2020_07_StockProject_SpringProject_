
ClassicEditor

    .create(document.querySelector("#content"), {
        cloudServices: {
            tokenUrl: 'https://72301.cke-cs.com/token/dev/OOPLXFC6Yfzk0nDEVWJAdNq7aZ4VsGxnWhbBBhtZP6GBhNq8jkBvbW6EzaHv',
            uploadUrl: 'https://72301.cke-cs.com/easyimage/upload/'
        },
        image: {
            resizeUnit: 'px'
        }
    } )

        .then(editor => {

            // console.log(editor);

        })

        .catch(error => {

            console.error(error);

        });
