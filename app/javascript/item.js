
function calculation(){
  const itemPrice = document.getElementById("item-price")
  const addTaxPrice = document.getElementById("add-tax-price")
  const profit = document.getElementById("profit")

  itemPrice.addEventListener('change', function(){
    const commission = (Math.floor(itemPrice.value * 0.1))
    addTaxPrice.innerHTML = commission
    salesProfit = (Math.floor(itemPrice.value-commission))
    profit.innerHTML = salesProfit
  })
}
window.addEventListener('load', calculation)