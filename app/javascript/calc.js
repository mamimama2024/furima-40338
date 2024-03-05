function calc (){
  const priceInput = document.getElementById("item-price");
  priceInput.addEventListener("input",() => {
    
    const addTaxDom = document.getElementById("add-tax-price");
    const tax = Math.floor(priceInput.value*0.1);
    addTaxDom.innerHTML = tax
    
    const profitDom = document.getElementById("profit");
    const profit = Math.floor(priceInput.value-tax)
    profitDom.innerHTML = profit

  });
};

window.addEventListener('turbo:load', calc);