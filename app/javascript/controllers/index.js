import { application } from "./application"

import HelloController from "./hello_controller"
application.register("hello", HelloController)

import ModalController from "./modal_controller"
application.register("modal", ModalController)
application.register("modal", ModalController)
