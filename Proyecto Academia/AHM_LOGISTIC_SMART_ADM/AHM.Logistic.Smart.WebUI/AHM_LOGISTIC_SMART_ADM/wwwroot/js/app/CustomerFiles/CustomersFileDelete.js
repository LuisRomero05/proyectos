﻿function DeleteCustomersFile(id) {
    Swal.fire({
        width: '20%',
        height: '20%',
        text: "¿Estás seguro de eliminar este registro?",
        icon: 'warning',
        showCancelButton: true,
        cancelButtonText: 'Cancelar',
        confirmButtonText: 'Aceptar',
        confirmButtonColor: '#6c757d',
        cancelButtonColor: '#001f52',

    }).then((result) => {
        if (result.isConfirmed) {
            $.ajax({
                type: "DELETE",
                url: BaseUrl + "/CustomersFile/Delete?Id=" + id,
            }).done(function (data) {
                var result = true;
                result = NotificationDelete(data.success, data.message, data.id, data.data, data.type)
                if (result) {
                    done = true;
                    Swal.fire({
                        width: '20%',
                        height: '20%',
                        title: '¡Eliminado!',
                        text: '¡Registro eliminado correctamente!',
                        icon: 'success',
                        showConfirmButton: false,
                    });
                    setTimeout(function () {
                        location.reload();
                    }, 1500)
                }
            });
        }
    })
}