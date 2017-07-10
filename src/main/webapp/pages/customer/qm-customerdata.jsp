<!DOCTYPE html>
<html>

	<head>
		<meta charset="UTF-8">
		<title></title>
		<link rel="stylesheet" type="text/css" href="../../script/Amaze/assets/css/amazeui.min.css" />
		<link rel="stylesheet" type="text/css" href="../../../reset.css" />
		<link rel="stylesheet" type="text/css" href="qm-customerdata.css" />
	</head>

	<body>
		<div class="bodybox">
			
		
		<div class="groupheader" >
			
		</div>
		<div class="data-module">
			<div class="groupdata qm-team">
				<div class="groupdata-box">

					<div class="groupdata-title">
						<h4 class="qm-c-p ">客户资料</h4>
						<div class="am-u-sm-2 am-fr" onclick="Groupdata_select(this)" onmouseleave="Mouseleave(this)" >
							<div class="groupdata_select">
								生产场地<span class="am-icon-angle-down "></span>
								<div class="groupdata_select-ul">
									<div>
										<a class="site-select-a" href="qm-sitedata.html">场地1</a>
									</div>
									<div>
										<a class="site-select-a" href="qm-sitedata.html">场地2</a>
									</div>

									<div>添加场地</div>
								</div>
							</div>
						</div>

					</div>
					<div class="groupdata-cont">
						<div class="am-u-sm-10">
							<ul>
								<li class="groupdata-li"><span class="am-u-sm-2">客户名称 :</span><input class="am-u-sm-8 am-u-end" type="" name="" id="" value="" /></li>
								<li class="groupdata-li"><span class="am-u-sm-2">客户性别 :</span>
									<div class="am-u-sm-9 pop-div2 sex-show" style="display: block;line-height: 35px;">
										女
									</div>
									<!--poptwo-c-lia1-->
									<div class="am-u-sm-8 am-u-end pop-div2 sex" style="display: none;">
										<a href="###" name="male" onclick="PopInput(this)" class="poptwo-c-lia  man">男</a>
										<a href="###" onclick="PopInput(this)" name="woman" class="poptwo-c-lia woman">女</a>
									</div>
								</li>
								<li class="groupdata-li"><span class="am-u-sm-2">联系电话 :</span><input class="am-u-sm-8 am-u-end" type="" name="" id="" value="" /></li>
								<li class="groupdata-li"><span class="am-u-sm-2">客户生日 :</span>
									<div style="height: 53px;padding: 0;float: left;" class="am-u-sm-8 am-u-end">
										<div class="poptime ">
											<input class=" am-u-sm-10" type="" name="" value="" />
											<button onclick="QmTime(this)" style="display: none;" class="am-btn am-btn-default databut am-icon-calendar qm-time-but" data-am-datepicker="{format: 'yyyy-mm-dd'}" type="button"></button>
										</div>
									</div>
								</li>
								<li class="groupdata-li"><span class="am-u-sm-2">身份证号 :</span><input class="am-u-sm-8 am-u-end" type="" name="" id="" value="" /></li>
								<li class="groupdata-li"><span class="am-u-sm-2">信用评级 :</span>
									<div class="am-u-sm-8 am-u-end groupdata-credit groupdata-credit-rate">
										<a class="groupdata-grade groupdata-credit-bg" onclick="Credit(this)">优秀</a>
										<a class="groupdata-grade groupdata-credit-bg" onclick="Credit(this)">一般</a>
										<a class="groupdata-grade groupdata-credit-bg" onclick="Credit(this)">差评</a>

									</div>

								</li>
								<li class="groupdata-li">
									<span class="am-u-sm-2 ">所在区域 :</span>
									<div class="am-u-sm-8 am-u-end">
										<!--style="z-index: 200;"-->
										<input style="width: 100%;" type="" name="" onclick="Site(this);return false;" value="" placeholder="地址" />
										<div class="am-tabs qm-site" data-am-tabs="{noSwipe: 1}" style="border: 0;">
											<ul class="am-tabs-nav am-nav am-nav-tabs qm-site-ul" style="border: 0;">
											</ul>
											<div class="am-tabs-bd" style="background: #dcd2d2;border: 0;">
											</div>

										</div>
									</div>
								</li>
								<li class="groupdata-li"><span class="am-u-sm-2">详细地址 :</span><input class="am-u-sm-8 am-u-end" type="" name="" id="" value="" /></li>
								<li class="groupdata-li"><span class="am-u-sm-2">客户分类 :</span>
									<select name="" class="groupdata-sel am-u-sm-8 am-u-end" disabled="disabled" style="padding: 0;">
										<option value="">分类1</option>
										<option value="">分类2</option>
										<option value="">分类3</option>

									</select>
								</li>
							</ul>

						</div>
						<div class="am-u-sm-2 am-u-end">
							<div class="qm-c-compile1" onclick="Compile(this)">
								编辑
							</div>
							<div class="qm-c-compile1 " style="display: none;">
								取消
							</div>

						</div>

					</div>
				</div>
			</div>
			<!--客户状态-->
			<div class="groupdata qm-team">
				<div class="groupdata-box">

					<div class="groupdata-title">
						<h4 class="qm-c-p">客户状态</h4>

					</div>
					<div class="groupdata-cont groupdata-cont2">
						<div class="am-u-sm-12">
							<ul>
								<li class="groupdata-li"><span class="am-u-sm-2">建立档案:</span><span class="groupdata-record">2017/5/21</span><span>(已通过)</span></li>
								<li class="groupdata-li"><span class="am-u-sm-2">建立账号:</span>
									<div class="am-u-sm-10 am-u-end groupdata-credit">
										<!--<span class="groupdata-checkbox ">成功建账<span>2017/5/2</span></span>-->
										<span class="groupdata-checkbox ">未建账</span>
                                          <span class="sponsor">发起建账</span>
										<!--<span class="groupdata-checkbox "></span>-->

									</div>
								</li>
								<li class="groupdata-li"><span class="am-u-sm-2">资料更新:</span>
									<div class="am-u-sm-10 deal-state">
										<div class="deal-state1"><span>数次</span><span class="deal-state2">5</span></div>

										<div class="deal-state1"><span>更新时间</span><span class="deal-state2">2017/5/21</span></div>

									</div>
								</li>
								<li class="groupdata-li"><span class="am-u-sm-2">最近交易:</span>
									<div class="am-u-sm-10  deal-state">

										<div class="deal-state1"><span>时间</span><span class="deal-state2">2017/5/21</span></div>

									</div>
								</li>

							</ul>

						</div>

					</div>
				</div>
			</div>
			<!--删除-->
			<div class=" data-del-off ">

				<div>
					<button class="del-but" onClick="javascript :history.back(-1);">返回</button>
				</div>
				<div>
					<button class="del-but">删除</button>
				</div>
				<div>
					<button class="del-but">移交客户</button>
				</div>
				<div>
					<button class="del-but">申请协助</button>
				</div>
				<div>
					<button class="del-but">客户订单</button>
				</div>
				<div>
					<button class="del-but">客户跟进</button>
				</div>

			</div>
		</div>
		<!--弹窗-->
		<div id="Prompt-box" class="potential-box">

			<div class="pop-one ">
				<div class="potential ">
					<div class="potential-left">待跟进客户</div>
					<div class="potential-right">X</div>
				</div>
				<div class="potential-cont">
					<div class="potential-cont-box">
						<ul class="potential-cont-ul">
							<li class="potential-cont-li">
								<div class="potential-cont-name">嘎嘎嘎</div>
								<div class="potential-cont-a">
									<div class="potential-cont-span"></div>
								</div>

							</li>
							<li class="potential-cont-li">
								<div class="potential-cont-name">嘎嘎嘎</div>
								<div class="potential-cont-a">
									<div class="potential-cont-span"></div>
								</div>

							</li>
							<li class="potential-cont-li">
								<div class="potential-cont-name">嘎嘎嘎</div>
								<div class="potential-cont-a">
									<div class="potential-cont-span"></div>
								</div>

							</li>
							<li class="potential-cont-li">
								<div class="potential-cont-name">嘎嘎嘎</div>
								<div class="potential-cont-a">
									<div class="potential-cont-span"></div>
								</div>

							</li>
							<li class="potential-cont-li">
								<div class="potential-cont-name">嘎嘎嘎</div>
								<div class="potential-cont-a">
									<div class="potential-cont-span"></div>
								</div>

							</li>

						</ul>
					</div>
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
					</div>

				</div>

			</div>
		</div>
		<!--人员弹窗-->
		<!--<div class="am-popup change-popup" id="popup2">
			<div class="am-popup-inner">
				<div class="am-popup-hd" style="background: #1367fe;">
					<h4 class="am-popup-title" style="color: #FFFFFF;">添加客户</h4>
					<span data-am-modal-close class="am-close">&times;</span>
				</div>
				<div class="am-popup-bd change-bd">
					<div class="popthree">
						<ul class="poptwo-c-ul">
							<li class="poptwo-c-li">
								<div class="am-u-sm-3 pop-div1">客户姓名 :</div>
								<div class="am-u-sm-9 pop-div2"><input type="" name="" value="" /></div>
							</li>
							<li class="poptwo-c-li">
								<div class="am-u-sm-3 pop-div1">客户性别 :</div>
							
								<div class="am-u-sm-9 pop-div2 sex">
									<a href="###" name="male" onclick="PopInput(this)" class="poptwo-c-lia poptwo-c-lia1 man">男</a>
									<a href="###" onclick="PopInput(this)" name="woman" class="poptwo-c-lia woman">女</a>
								</div>
							</li>
							<li class="poptwo-c-li">
								<div class="am-u-sm-3 pop-div1">客户生日 :</div>
								<div class="am-u-sm-9 pop-div2">
									<div class="poptime poptime1">

										<input class="pop-input" type="" name="" id="showtimebox" value="" />
										<button onclick="QmTime(this)" class="am-btn am-btn-default  am-icon-calendar qm-time-but" data-am-datepicker="{format: 'yyyy-mm-dd'}" type="button"></button>
									</div>
								</div>
							</li>
							<li class="poptwo-c-li">
								<div class="am-u-sm-3 pop-div1">所在城市 : </div>
								<div class="am-u-sm-9 pop-div2">
									<input type="" name="" onclick="Site(this);" value="" placeholder="地址" />
									<div class="am-tabs qm-site" data-am-tabs="{noSwipe: 1}">
										<ul class="am-tabs-nav am-nav am-nav-tabs qm-site-ul">
										</ul>
										<div class="am-tabs-bd" style="background: #dcd2d2;border: 0;">
										</div>

									</div>
								</div>
							</li>
							<li class="poptwo-c-li">
								<div class="am-u-sm-3 pop-div1">详细地址 :</div>
								<div class="am-u-sm-9 pop-div2"><input type="" name="" value="" /></div>
							</li>
							<li class="poptwo-c-li">
								<div class="am-u-sm-3 pop-div1">联系电话 :</div>
								<div class="am-u-sm-9 pop-div2"><input type="" name="" value="" /></div>
							</li>
							<li class="poptwo-c-li">
								<div class="am-u-sm-3 pop-div1">经营范围 :</div>
								<div class="am-u-sm-9 pop-div2"><input type="" name="" value="" /></div>
							</li>

							<li class="poptwo-c-li">
								<div class="am-u-sm-3 pop-div1">客户分类 :</div>
								<div class="am-u-sm-9 pop-div2">
									<select name="">
										<option value="">分类一</option>
										<option value="">分类二</option>

									</select>
								</div>
							</li>
							<li class="poptwo-c-li">

								<button class="poptwo-post">提交</button>
								<button data-am-modal-close class="poptwo-del">取消</button>

							</li>

						</ul>

					</div>
				</div>
			</div>
		</div>-->
		</div>
	</body>
	<script src="../../script/jquery/jquery-3.0.0.min.js"></script>
	<script src="../../script/Amaze/assets/js/amazeui.min.js"></script>
	<script type="text/javascript" src="../../script/js/myjs.js"></script>
	<script type="text/javascript" src="../customer/control.js"></script>
	<script type="text/javascript" src="qm-group.js"></script>
     <script type="text/javascript">
     	Mouseleave=function(item){
     		$(item).css("border",'0').find(".groupdata_select-ul").css('display','none')
     	}
     </script>
</html>