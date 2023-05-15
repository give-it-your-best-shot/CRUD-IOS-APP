# EnouvoTest
## Demo App
### Main page
Bao gồm 
- 1 dropdown default 
- 1 dropdown để chọn feature(ở đây có hai feature là transfer online và transfer offline)
- 1 scroll view gồn 1 collection view
 
Trong collection view sẽ có những ApprovalMatrixCell chứa các data được tạo ra sau khi add
- Trong mỗi cell sẽ có một collection view khác dùng để generate các ApproverCell
>Khi nhấn vào 1 cell sẽ navigate qua trang DeleteAndUpdate để chỉnh sửa hoặc xoá
<div>
<img src="https://github.com/give-it-your-best-shot/EnouvoTest/blob/main/Document/main_page.png" width="210" height="400" />
&emsp;&ensp;&emsp;&ensp;
<img src="https://github.com/give-it-your-best-shot/EnouvoTest/blob/main/Document/main_page2.png" width="210" height="400" />
<div/>
<br>
<br>

### Add page
Bao gồm 1 scroll view cho phép người dùng di chuyển qua một danh sách các quan điểm mà chiếm nhiều không gian hơn màn hình vật lý. Trong scroll view bao gồm:
- 1 textField để nhập tên
- 1 dropdown để chọn feature(ở đây có hai feature là transfer online và transfer offline)
- 2 textField để nhập IDR min và IDR max
- 1 textField để nhập số lượng Approver(numOfApproval) (thuộc tính này dùng để xác định số lượng ApproverCell mà collection view sẽ generate)
> Sau khi nhấn button ADD sẽ tự động tạo một đối tượng ApprovalMatrix dựa trên data đã nhập vào và add đối tượng đó vào list đồng thời add một ApprovalMatrixCell gồm data của đối tượng đó vào collection view của trang Main. Sau đó generate ra những ApproverCell số lượng dựa vào thuộc tính numOfApproval của class ApprovalMatrix. Sau đó reload data của collectionview trang main để cập nhập lại
> Khi nhấn button RESET sẽ tự động set các giá trị của các field cũng như dropdown về ban đầu
<div>
<img src="https://github.com/give-it-your-best-shot/EnouvoTest/blob/main/Document/add_page.png" width="210" height="400" />
&emsp;&ensp;&emsp;&ensp;
<img src="https://github.com/give-it-your-best-shot/EnouvoTest/blob/main/Document/add_page2.png" width="210" height="400" />
<div/>
<br>
<br>

### Delete And Update page
Bao gồm 1 scroll view cho phép người dùng di chuyển qua một danh sách các quan điểm mà chiếm nhiều không gian hơn màn hình vật lý. Trong scroll view bao gồm:
- 1 textField để nhập tên
- 1 dropdown để chọn feature(ở đây có hai feature là transfer online và transfer offline)
- 2 textField để nhập IDR min và IDR max
- 1 textField để nhập số lượng Approver (thuộc tính này dùng để xác định số lượng cell approver mà collection view sẽ generate)
> Sau khi nhấn button Delete thì app sẽ xoá đối tượng ApprovalMatrix đó ra khỏi list và xoá ApprovalMatrixCell đó khỏi collection view trang main
> Khi nhấn Update thì các data của đối tượng ApprovalMatrix được thay đổi lại bằng các giá trị trong textField và dropdown. Sau đó reload data trong collection view trang main để cập nhập lại các cell
> Khi nhấn button RESET sẽ tự động set các giá trị của các field cũng như dropdown về ban đầu
<div>
<img src="https://github.com/give-it-your-best-shot/EnouvoTest/blob/main/Document/delete_and_update_page.png" width="210" height="400" />
&emsp;&ensp;&emsp;&ensp;
<img src="https://github.com/give-it-your-best-shot/EnouvoTest/blob/main/Document/delete_and_update_page2.png" width="210" height="400" />
<div\>
<br>
<br>

# Thanks for watching
