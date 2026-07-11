import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  connect() {
    // anima entrada
    requestAnimationFrame(() => {
      this.element.classList.remove("translate-y-[-20px]", "opacity-0");
      this.element.classList.add("translate-y-0", "opacity-100");
    });

    // auto fechar
    this.timeout = setTimeout(() => {
      this.close();
    }, 4000);
  }

  close() {
    this.element.classList.add("opacity-0", "-translate-y-5");

    setTimeout(() => {
      this.element.remove();
    }, 300);
  }
}
