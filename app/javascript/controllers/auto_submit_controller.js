import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="auto-submit"
export default class extends Controller {
 connect() {
    console.log("connect")
    this.form = this.element;
  }

  submit(){
    console.log("submit")
   this.form.requestSubmit(); 
  }
}
