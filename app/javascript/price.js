window.addEventListener('load', function(){

  const priceInput = document.getElementById("item-price");
  priceInput.addEventListener("input", () => {
    const inputValue = priceInput.value;
    const addTaxDam = document.getElementById("add-tax-price");
    addTaxDam.innerHTML = Math.floor(priceInput.value/10);
    const Profit = document.getElementById("profit");
    Profit.innerHTML = Math.floor(priceInput.value - priceInput.value/10);
})

})