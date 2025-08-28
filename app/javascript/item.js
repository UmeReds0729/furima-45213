document.addEventListener("DOMContentLoaded", () => {
  let itemPrice = document.getElementById("item-price")

  itemPrice.addEventListener("input", () => {
    let price = Number(itemPrice.value)
    let commission = price * 0.1
    let profit = price - commission

    let commissionArea = document.getElementById("add-tax-price");
    let profitArea = document.getElementById("profit");

    commissionArea.textContent = commission;
    profitArea.textContent = profit;
  });
});