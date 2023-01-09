window.addEventListener('load', () => {
  const priceInput = document.getElementById("item-price");

   priceInput.addEventListener("input", () => {
     const TaxDom = document.getElementById("add-tax-price");
     TaxDom.innerHTML = Math.floor(priceInput.value * 0.1 );
     const ProfitDom = document.getElementById("profit");
    
     ProfitDom.innerHTML = Math.floor(priceInput.value - Math.floor(priceInput.value * 0.1 ))
 })
});