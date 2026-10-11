import core/data
import lustre/element.{type Element}

pub opaque type Component(message) {
  
  HTMLComponent(name: String, styles: List(data.Style), identity: Element(message))
}

pub type LiveComponent(t, message) {
  LiveComponent(component: Component(message), schema: data.Schema(t))
}

pub fn newHTML(name: String, styles: List(data.Style), input: String) {
  
}