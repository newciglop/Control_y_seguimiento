// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

require("jquery")
require("flatpickr")
import { Spanish } from "flatpickr/dist/l10n/es.js";
require("../customize/bootstrap-select.min")
require("@rails/ujs").start()
require("turbolinks").start()
require("@rails/activestorage").start()
require("channels")





import 'bootstrap';
import 'css/styles'


require("trix")
require("@rails/actiontext")

document.addEventListener('turbolinks:load', function() {

    $('.select2').select2(
        {
            width: 'resolve',
           }
    );


    flatpickr(".datepicker", {
        "locale": Spanish, // locale for this instance only
        dateFormat: "Y-m-d",
    });

})














/*
document.addEventListener('turbolinks:load',function(){
    document.addEventListener('click',() => {
        let element = event.target.closest('.text-content')
        if (!element) return
        element.classList.add('d-none')
        element.nextElementSibling.classList.remove('d-none')
    })

    document.addEventListener('click',() => {
        if (!event.target.matches('.cancel')) return;
        event.preventDefault()
        let element = event.target.closest('.form-content')
        element.classList.add('d-none')
        element.previousElementSibling.classList.remove('d-none')
    })
})*/











import "controllers"
