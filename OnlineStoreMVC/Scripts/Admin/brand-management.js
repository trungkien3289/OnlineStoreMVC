var BrandManagement = {
    deleteBrand: function (id, brandName) {
        var title = "Xóa nhà sản xuất";
        var message = "Bạn có muốn xóa " + brandName + " ?";
        MessageBox.showMessageBox(title, message, function () {
            $.ajax({
                url: '/BrandManagement/Delete',
                data: { id: id },
                type: 'POST',
                success: function () {
                    window.location.replace("/BrandManagement/Index");
                },
                error: function () {
                    alert("Delete fail!");
                }
            });
        });
    }
}