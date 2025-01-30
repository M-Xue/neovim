class Foo {}

const m: { exports?: any } = {};

m.exports = class extends Foo {
  prompting() {
    console.log("hello");





    const prompts = [{}];
    return prompts.map((a) => {});
  }
};

console.log("bar");





function foo(a: number, b: string, c: string[]) {
  console.log(a);
  console.log(b);
  console.log(c);
}
class Bar {}
foo(1, "1", ["1"]);
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
