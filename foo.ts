class Foo {}

const m: { exports?: any } = {};

m.exports = class extends Foo {
  prompting() {
    console.log("hello");
    const prompts = [
      {
        message: "test",
      },
    ];
    return prompts.map((a) => {});
  }
};

function foo() {}
class Bar {}
Bar;

export const loadProduct = (product) => {
  let xhr = new XMLHttpRequest();
  let output = "";
  xhr.open("GET", "testFiles/products.json", true);
  xhr.onload = function () {
    if (this.status === 200) {
      JSON.parse(this.responseText);
    }
    document.querySelector("#product")!.innerHTML = output;
  };
};
let f = [];
