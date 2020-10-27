function itemPrice() {
  const priceInput = document.getElementById("item-price");
  priceInput.addEventListener("input", () => {
    const inputValue = priceInput.value;
    
    const addTaxDom = document.getElementById("add-tax-price");
    addTaxDom.innerHTML =  Math.floor(inputValue / 10);
    
    const profitDom = document.getElementById("profit");
    profitDom.innerHTML = ( inputValue - Math.floor(inputValue / 10) );
});
}
window.addEventListener('load', itemPrice)