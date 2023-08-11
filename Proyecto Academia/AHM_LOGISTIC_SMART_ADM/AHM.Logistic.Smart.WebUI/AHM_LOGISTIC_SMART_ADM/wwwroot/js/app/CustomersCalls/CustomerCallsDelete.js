﻿function DeleteCustomerCalls(id) {
    Swal.fire({
        width: '20%',
        height: '20%',
        text: "¿Estás seguro de eliminar este registro?",
        icon: 'warning',
        showCancelButton: true,
        cancelButtonText: 'Cancelar',
        confirmButtonColor: '#6c757d',
        cancelButtonColor: '#001f52',
        confirmButtonText: 'Aceptar'

    }).then((result) => {
        if (result.isConfirmed) {

            $.ajax({
                type: "DELETE",
                url: BaseUrl + "/CustomersCalls/Delete?Id=" + id,
            }).done(function (data) {
                location.reload();
            }).fail(function (data) {
                NotificationMessage(data.success, "", data.id, data.data, data.type);
            });
        }
    })
}

