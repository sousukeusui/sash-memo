document.addEventListener("turbo:load", function(){
  drawOpening()
});

//　turbo-streamの実行時に描画を更新する
$(document).on('turbo:before-stream-render',function(){
  setInterval(function(){
    drawOpening()
  },100)
})


function drawOpening(){
  let openingCanvas = document.getElementById('opening');
  if (!openingCanvas) return;
  let openingCtx = openingCanvas.getContext("2d")
  openingCtx.clearRect(0, 0, 500, 500);  //turbo-stream用に残っている描画を削除

  //横寸法
  let widthUp = document.getElementById('width-up')
  let widthMiddle = document.getElementById('width-middle')
  let widthDown = document.getElementById('width-down')

  //縦寸法
  let heightLeft = document.getElementById('height-left')
  let heightMiddle = document.getElementById('height-middle')
  let heightRight = document.getElementById('height-right')

  const startZero = 0
  const startX = 100
  const startY = 150
  const sizeX = 300
  const sizeY = 350
  const varticalCenter = sizeY/2 + startY
  const horizontalCenter = sizeX/2 +startX
  const horizontalOneThiird = sizeX/3 + startX; //3分の1の位置
  const goalX = startX + sizeX
  const goalY = startY + sizeY
  const arrowSize = 10
  const fontSize = 30
  const boxMargin = 10

  // 縦横中央寸法の四角い枠用
  const widthBoxX = horizontalCenter
  const widthBoxY = varticalCenter - boxMargin * 5
  const heightBoxX = horizontalOneThiird + boxMargin
  const heightBoxY = varticalCenter + boxMargin * 5
  const sizeBoxLong = 90
  const sizeBoxShort = 50

  //開口図のベースとなる四角形
  openingCtx.strokeRect(startX, startY, sizeX, sizeY)

  //横戦と矢印
  openingCtx.moveTo(startX, varticalCenter) //左辺の真ん中の点に移動
  openingCtx.lineTo(startX+arrowSize, varticalCenter+arrowSize) //左辺矢印の下側
  openingCtx.moveTo(startX, varticalCenter) //左辺の真ん中の点に移動
  openingCtx.lineTo(startX+arrowSize, varticalCenter-arrowSize) //左辺矢印の上側
  openingCtx.moveTo(startX, varticalCenter) //左辺の真ん中の点に移動
  openingCtx.lineTo(goalX,varticalCenter)  //右辺の真ん中まで線を引く
  openingCtx.lineTo(goalX-arrowSize,varticalCenter+arrowSize) //右辺矢印下側
  openingCtx.moveTo(goalX, varticalCenter) //左辺の真ん中の点に移動
  openingCtx.lineTo(goalX-arrowSize, varticalCenter-arrowSize) //右辺矢印上側

  //縦線と矢印
  openingCtx.moveTo(horizontalOneThiird, startY) //上辺3分の１の位置に移動
  openingCtx.lineTo(horizontalOneThiird+arrowSize, startY+arrowSize) // 右側の矢印
  openingCtx.moveTo(horizontalOneThiird, startY) //上辺3分の１の位置に移動
  openingCtx.lineTo(horizontalOneThiird-arrowSize, startY+arrowSize) // 左側の矢印
  openingCtx.moveTo(horizontalOneThiird, startY) //上辺3分の１の位置に移動
  openingCtx.lineTo(horizontalOneThiird, goalY) // 下辺３分の1まで線を引く
  openingCtx.lineTo(horizontalOneThiird+arrowSize, goalY-arrowSize) // 右側の矢印
  openingCtx.moveTo(horizontalOneThiird, goalY) //上辺3分の１の位置に移動
  openingCtx.lineTo(horizontalOneThiird-arrowSize, goalY-arrowSize) //左側の矢印

  //中央サイズの枠
  openingCtx.strokeRect(widthBoxX, widthBoxY - boxMargin, sizeBoxLong, sizeBoxShort) //横中央のサイズ入れる枠
  openingCtx.strokeRect(heightBoxX, heightBoxY, sizeBoxLong, sizeBoxShort) //縦中央のサイズ入れる枠

  openingCtx.stroke()

  //図に寸法記入
  openingCtx.font = `${fontSize}px serif`;
  openingCtx.fillText(widthUp.textContent, horizontalOneThiird, startY - fontSize * 0.8) // 横上寸法表示
  openingCtx.fillText(widthDown.textContent, horizontalOneThiird, startY + sizeY + fontSize * 1.5) //横下寸法表示
  openingCtx.fillText(heightLeft.textContent, startZero - fontSize, varticalCenter) // 左縦寸法表示
  openingCtx.fillText(heightRight.textContent, startX + sizeX - fontSize, varticalCenter) // 縦右寸法表示
  openingCtx.fillText(widthMiddle.textContent, widthBoxX - fontSize, widthBoxY + fontSize) // 横中央寸法表示
  openingCtx.fillText(heightMiddle.textContent,heightBoxX - fontSize, heightBoxY + fontSize) //縦中央駿府表示
}