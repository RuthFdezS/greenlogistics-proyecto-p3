const items = document.querySelectorAll('.slider img');
const itemCount = items.length;
const nextItem = document.querySelector('.next');
const previousItem = document.querySelector('.previous');
let count = 0;
//Pedidos
const btn_nuevo_pedido = document.getElementById('realizar_nuevo_pedido');
const btn_actualizar_pedido = document.getElementById('actualizar_pedido');

function showNextItem() {
  items[count].classList.remove('active');

  if(count < itemCount - 1) {
    count++;
  } else {
    count = 0;
  }

  items[count].classList.add('active');
  console.log(count);
}

function showPreviousItem() {
  items[count].classList.remove('active');

  if(count > 1) {
    count--;
  } else {
    count = itemCount - 1;
  }

  items[count].classList.add('active');
  console.log(count);
}

// function mostrarActualizarPedido(){
//     document.getElementById('nuevo_pedido').classList.remove('ocultar');
//     document.getElementById('nuevo_pedido').classList.add('mostrar');
// }

nextItem.addEventListener('click', showNextItem);
previousItem.addEventListener('click', showPreviousItem);

// btn_actualizar_pedido.addEventListener('click',mostrarActualizarPedido);
// btn_nuevo_pedido.addEventListener('click',mostrarNuevoPedido);

