document.addEventListener("DOMContentLoaded", function(){
  const canvas = this.getElementById("mycanvas");
  canvas.width = 500;
  canvas.height = 500;
  const ctx = canvas.getContext('2d');
  ctx.fillStyle = 'red';
  ctx.fillRect(50, 50, 300, 300);
  ctx.beginPath();
  ctx.arc(200, 200, 100, 3.28, 3.27);
  ctx.stroke();
});
