[V] 建立EF及連線，建立諮詢服務的Controller、Service、Repository類別
	新增 預約諮詢的Vm、Dto類別，新增查詢諮詢清單的動作。

[V] 建立預約諮詢的vm、dto以及Action，修改諮詢服務的Controller、Service、Repository
	建立相關的JsonResult完成預約諮詢下拉清單的資料提供

[V] 完成 Member相關的Controller、Service、Repository，完成crud，建立寄送email的功能與收到確認信後的ViewPage

[v] 完成 寵物日誌與相簿的Controller、Service、Repository，完成crud

[v] 建立EmailSender的主控台應用程式、Service、Repository，完成掃描資料庫內逾時諮詢的資料，並修改狀態建立帳單與收入

[WorkingOn] 新增GetMember Action in BookDateController, 修改Book.Page、Book Action 使其可帶入id作欄位預設
		修改儲值頁面使其新增完後會刷新頁面、修改寵物日誌頁面、預約頁面，新增餘額不足的驗證與sweetAlert2
		修改_Layout 使其可以顯示帳戶剩餘金額，並增加點擊預約按鈕時的剩餘金額判斷
