const infoBox = document.getElementById("infoBox");
infoBox.textContent = "請於左側選擇電點金額";

// 當使用者選擇某個金額時更新顯示內容
document.querySelectorAll('input[name="amount"]').forEach((radio) => {
  radio.addEventListener("change", function () {
    const selectedAmount = this.value;

    // 動態生成確認購買內容的表單
    infoBox.innerHTML = `<div id="purchaseInfo" class="center-text">
    <h3>確認購買內容</h3>
    <p><strong>商品:</strong> <span id="product">點數 × ${selectedAmount}</span></p>
    <p><strong>價格:</strong> <span id="price">NT$ ${selectedAmount}</span></p>
    <p><strong>儲值方式:</strong> 點擊支付</p>
    <p><strong>角色名稱:</strong> 張三</p>
    <p>
      <input type="checkbox" id="agreeTerms">
      我同意所有條款
    </p>
    <button type="submit" onclick="submitForm()">確認</button>
  </div>`;
  });
});

// 假設的提交表單功能，使用 Bootstrap 模態彈窗
function submitForm() {
  const isAgreed = document.getElementById("agreeTerms").checked;
  const modalMessage = document.getElementById("modalMessage");
  const resultModal = new bootstrap.Modal(
    document.getElementById("resultModal")
  );

  if (isAgreed) {
    modalMessage.textContent = "購買成功！";
  } else {
    modalMessage.textContent = "請同意條款後再進行確認";
  }

  // 顯示模態彈窗
  resultModal.show();
}
