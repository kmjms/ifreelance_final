
function confirmationMessage(message){
    swal(
        'Exitoso',
        message,
        'success'
      )
}

function showMessage(message){
    swal({
        position: 'top-right',
        type: 'success',
        title: message,
        showConfirmButton: false,
        timer: 1500
      })
}

function confirmationAlert(confirmMessage,goodMessage,badMessage,sucess,fail){
    swal({
        title: 'Estas Seguro ?',
        text: confirmMessage,
        type: 'warning',
        showCancelButton: true,
        confirmButtonColor: '#3085d6',
        cancelButtonColor: '#d33',
        confirmButtonText: 'Ok',
        cancelButtonText: 'Cancelar',
        confirmButtonClass: 'btn btn-success',
        cancelButtonClass: 'btn btn-danger',
        buttonsStyling: false
      }).then(function (result) {
        if (result.value) {
          swal(
            'Exito',
            goodMessage,
            'success'
          )
          sucess()
        // result.dismiss can be 'cancel', 'overlay',
        // 'close', and 'timer'
        } else if (result.dismiss === 'cancel') {
          swal(
            'Cancelado',
            badMessage,
            'error'
          )
          fail()
        }
      })
}

