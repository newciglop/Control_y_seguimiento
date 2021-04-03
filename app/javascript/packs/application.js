// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.



require("@rails/ujs").start()
require("turbolinks")
require("@rails/activestorage").start()
require("channels")
import 'bootstrap';
import 'css/styles'
require("../customize/bootstrap-select.min")
import flatpickr from "flatpickr";
import { Spanish } from "flatpickr/dist/l10n/es.js"




require("trix")
require("@rails/actiontext")



    // Example starter JavaScript for disabling form submissions if there are invalid fields



document.addEventListener('DOMContentLoaded', function() {
    flatpickr(".datepicker", {
        "locale": Spanish, // locale for this instance only
        dateFormat: "Y-m-d",
    });

})











