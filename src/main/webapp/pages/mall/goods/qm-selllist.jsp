<!DOCTYPE html>
<html>

	<head>
		<meta charset="UTF-8">
		<title></title>

		<link rel="stylesheet" href="../../../script/Amaze/assets/css/amazeui.min.css" />
		<link rel="stylesheet" type="text/css" href="../../../../reset.css" />
		<link rel="stylesheet" href="qm-selllist.css" />
	</head>

	<body>
 <div class="bodybox">
		<div class="goodslist">
			<header class="goodslist-header">
				<button class="goodslist-but" data-am-modal="{target: '#popup2'}">添加销售点</button>
			</header>
			<section class="goodslist-list">
				<div class="goodslist-list-titlebox">
					<div class="goodslist-list-title">
						<div class="goodslist-title-text">销售点列表</div>
					</div>
				</div>
				<div class="goodslist-list-table">
					<ul>
						<li class="goodslist-list-tr">
							<div>名称</div>
							<div>负责人</div>
							<div>联系电话</div>
							<div class="item4">操作</div>

						</li>
						<li class="goodslist-list-tr">
							<div>江门销售点</div>
							<div>韦善耀</div>
							<div>15224637863</div>
							<div class="item4">
								<a href="">编辑</a>
								<a href="">分配商品</a>								
								<a href="qm-goodslist.html">查看商品</a>
								<a href="javascript:void(0)" onclick="DellLi(this)">删除</a>
							</div>
						</li>

					</ul>
				</div>
			</section>

			<div class="paging">

				<div class="pagingright">
					下一页
				</div>
				<div class="pagingmodle">
					<span>1</span>/<span>4</span>
				</div>

				<div class="pagingleft">
					上一页
				</div>
				<div class="paging-num-box">
					显示条数:<span class="paging-num">30</span>
					<span class="paging-num">20</span>
					<span class="paging-num">10</span>
				</div>
			</div>
		</div>
		<!--弹窗-->
		<div class="am-popup change-popup" id="popup2">
			<div class="am-popup-inner">
				<div class="am-popup-hd" style="background: #1367fe;">
					<h4 class="am-popup-title" style="color: #FFFFFF;">添加销售点</h4>
					<span data-am-modal-close class="am-close" style="color: #FFFFFF;opacity: 1;fill-opacity: opacity-value;">&times;</span>
				</div>
				<div class="am-popup-bd change-bd">
					<div class="popthree">
						<ul class="poptwo-c-ul">
							<li class="poptwo-c-li">
								<div class="am-u-sm-3 pop-div1">销售点名称 :</div>
								<div class="am-u-sm-9 pop-div2"><input type="" name="" value="" /></div>
							</li>
							<li class="poptwo-c-li">
								<div class="am-u-sm-3 pop-div1">负责人名称 :</div>
								<div class="am-u-sm-9 pop-div2"><input type="" name="" value="" /></div>
							</li>
							<li class="poptwo-c-li">
								<div class="am-u-sm-3 pop-div1">联系电话 :</div>
								<div class="am-u-sm-9 pop-div2"><input type="" name="" value="" /></div>
							</li>
							<li class="poptwo-c-li">
								<div class="am-u-sm-3 pop-div1">所属部门 :</div>
								<div class="am-u-sm-9 pop-div2">
									<select name="">
										<option value="">业务部</option>
										<option value="">技术部</option>

									</select>
								</div>
							</li>
							<li>
								<div class="site-map">
									<div>
										<span>所在区域定位</span>
										<span></span>
										<input type="text" />
									</div>
								</div>
							</li>
							<li class="poptwo-c-li">
								<button class="poptwo-but">提交</button>
								<button data-am-modal-close class="poptwo-but">取消</button>

							</li>

						</ul>

					</div>
				</div>
			</div>
		</div>
</div>
	</body>
	<script src="../../../script/jquery/jquery-3.0.0.min.js"></script>
	<script src="../../../script/Amaze/assets/js/amazeui.min.js"></script>
   <script type="text/javascript">
   	DellLi=function(item){
   		$(item).parents('li').remove()
   	}
   </script>
</html>