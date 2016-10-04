<body class="sidebar-fixed topnav-fixed dashboard4">
	<!-- WRAPPER -->
	<div id="wrapper" class="wrapper">
		<!-- TOP BAR -->
		<div class="top-bar navbar-fixed-top">
			<div class="container">
				<div class="clearfix">
					<a href="index-dashboard-v4.html#" class="pull-left toggle-sidebar-collapse"><i class="fa fa-bars"></i></a>
					<!-- logo -->
					<div class="pull-left left logo">
						<a href="index.html"><img src="assets/img/kingadmin-logo-white.png" alt="KingAdmin - Admin Dashboard" /></a>
						<h1 class="sr-only">Shinshop Dashboard</h1>
					</div>
					<!-- end logo -->
					<div class="pull-right right">
						<!-- search box -->
						<div class="searchbox">
							<div id="tour-searchbox" class="input-group">
								<input type="search" class="form-control" placeholder="enter keyword here...">
								<span class="input-group-btn">
									<button class="btn btn-default" type="button"><i class="fa fa-search"></i></button>
								</span>
							</div>
						</div>
						<!-- end search box -->
						<!-- top-bar-right -->
						<div class="top-bar-right">						
							<button type="button" id="global-volume" class="btn btn-link btn-global-volume"><i class="fa"></i></button>
							
							<!-- logged user and the menu -->
							<div class="logged-user">
								<div class="btn-group">
									<a href="index-dashboard-v4.html#" class="btn btn-link dropdown-toggle" data-toggle="dropdown">
										<img src="assets/img/user-avatar.png" alt="User Avatar" />
										<span class="name">Stacy Rose</span> <span class="caret"></span>
									</a>
									<ul class="dropdown-menu" role="menu">
										<li>
											<a href="index-dashboard-v4.html#">
												<i class="fa fa-user"></i>
												<span class="text">Profile</span>
											</a>
										</li>
										<li>
											<a href="index-dashboard-v4.html#">
												<i class="fa fa-cog"></i>
												<span class="text">Settings</span>
											</a>
										</li>
										<li>
											<a href="index-dashboard-v4.html#">
												<i class="fa fa-power-off"></i>
												<span class="text">Logout</span>
											</a>
										</li>
									</ul>
								</div>
							</div>
							<!-- end logged user and the menu -->
						</div>
						<!-- end top-bar-right -->
					</div>
				</div>
			</div>
			<!-- /container -->
		</div>
		<!-- END TOP BAR -->
		{{template "_sidebar.tpl"}}
		<!-- MAIN CONTENT WRAPPER -->
		<div id="main-content-wrapper" class="content-wrapper ">
			<!-- top general alert -->
			<div class="alert alert-danger top-general-alert">
				<span>If you <strong>can't see the logo</strong> on the top left, please reset the style on right style switcher (for upgraded theme only).</span>
				<button type="button" class="close">&times;</button>
			</div>
			<!-- end top general alert -->
			<div class="row">
				<div class="col-lg-4 ">
					<ul class="breadcrumb">
						<li><i class="fa fa-home"></i><a href="index-dashboard-v4.html#">Home</a></li>
						<li class="active">Dashboard</li>
					</ul>
				</div>
				<div class="col-lg-8 ">
					<div class="top-content">
						<ul class="list-inline quick-access">
							<li>
								<a href="charts-statistics-interactive.html">
									<div class="quick-access-item bg-color-green">
										<i class="fa fa-bar-chart-o"></i>
										<h5>CHARTS</h5><em>basic, interactive, real-time</em>
									</div>
								</a>
							</li>
							<li>
								<a href="page-inbox.html">
									<div class="quick-access-item bg-color-blue">
										<i class="fa fa-envelope"></i>
										<h5>INBOX</h5><em>inbox with gmail style</em>
									</div>
								</a>
							</li>
							<li>
								<a href="tables-dynamic-table.html">
									<div class="quick-access-item bg-color-orange">
										<i class="fa fa-table"></i>
										<h5>DYNAMIC TABLE</h5><em>tons of features and interactivity</em>
									</div>
								</a>
							</li>
						</ul>
					</div>
				</div>
			</div>
			<!-- main -->
			<div class="content">
				<div class="main-header">
					<h2>DASHBOARD v4</h2>
					<em>investment portfolio and market info</em>
				</div>
				<div class="main-content">
					<div class="row bottom-60px">
						<div class="col-md-2">
							<div class="investment-summary">
								<span class="info-label">Current Value</span>
								<strong>$67,300</strong>
							</div>
						</div>
						<div class="col-md-2">
							<div class="investment-summary">
								<span class="info-label">Total Invested</span>
								<strong>$50,000</strong>
							</div>
						</div>
						<div class="col-md-2 col-md-offset-2">
							<div class="investment-summary text-right">
								<span class="info-label">Today's Gain/Loss</span>
								<span class="inv-red"><strong>$147.85</strong> <i class="fa fa-caret-down"></i></span> <span class="percentage">0.43%</span>
							</div>
						</div>
						<div class="col-md-2">
							<div class="investment-summary text-right">
								<span class="info-label">Month’s Gain/Loss</span>
								<span class="inv-green"><strong>$1846.56</strong> <i class="fa fa-caret-up"></i></span> <span class="percentage">3.87%</span>
							</div>
						</div>
						<div class="col-md-2">
							<div class="investment-summary text-right">
								<span class="info-label">YTD’s Gain/Loss</span>
								<span class="inv-green"><strong>$17,300.00</strong> <i class="fa fa-caret-up"></i></span> <span class="percentage">15.53%</span>
							</div>
						</div>
					</div>
					<div class="row bottom-60px">
						<div class="col-md-8">
							<table class="table table-striped">
								<thead>
									<tr>
										<th>Asset Type</th>
										<th>Current Valuation</th>
										<th>Amount Invested</th>
										<th>Today's G/L</th>
										<th>Month's G/L</th>
										<th>YTD's G/L</th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<td><a href="index-dashboard-v4.html#">Stock</a></td>
										<td>$23,000</td>
										<td>$18,000</td>
										<td><span class="inv-red">0.34%</span></td>
										<td><span class="inv-green">4.56%</span></td>
										<td><span class="inv-green">18.28%</span></td>
									</tr>
									<tr>
										<td><a href="index-dashboard-v4.html#">Mutual Fund</a></td>
										<td>$2,300</td>
										<td>$2,000</td>
										<td><span class="inv-red">1.64%</span></td>
										<td><span class="inv-red">5.66%</span></td>
										<td><span class="inv-green">12.09%</span></td>
									</tr>
									<tr>
										<td><a href="index-dashboard-v4.html#">Fixed Assets</a></td>
										<td>$35,000</td>
										<td>$20,000</td>
										<td><span class="inv-red">8.54%</span></td>
										<td><span class="inv-red">12.78%</span></td>
										<td><span class="inv-green">25.32%</span></td>
									</tr>
									<tr>
										<td><a href="index-dashboard-v4.html#">Foreign Exchange</a></td>
										<td>$6,000</td>
										<td>$7,500</td>
										<td><span class="inv-green">12.88%</span></td>
										<td><span class="inv-red">17.85%</span></td>
										<td><span class="inv-red">30.28%</span></td>
									</tr>
									<tr>
										<td><a href="index-dashboard-v4.html#">Others</a></td>
										<td>$1,000</td>
										<td>$2,500</td>
										<td><span class="inv-red">15.50%</span></td>
										<td><span class="inv-red">27.33%</span></td>
										<td><span class="inv-red">35.21%</span></td>
									</tr>
									<tr>
										<td><a href="index-dashboard-v4.html#">Stock</a></td>
										<td>$23,000</td>
										<td>$18,000</td>
										<td><span class="inv-red">0.34%</span></td>
										<td><span class="inv-green">4.56%</span></td>
										<td><span class="inv-green">18.28%</span></td>
									</tr>
									<tr>
										<td><a href="index-dashboard-v4.html#">Mutual Fund</a></td>
										<td>$2,300</td>
										<td>$2,000</td>
										<td><span class="inv-red">1.64%</span></td>
										<td><span class="inv-red">5.66%</span></td>
										<td><span class="inv-green">12.09%</span></td>
									</tr>
								</tbody>
							</table>
						</div>
						<div class="col-md-4">
							<div id="investment-donut-chart"></div>
						</div>
					</div>
					<div class="row bottom-60px">
						<div class="col-md-3">
							<div class="stock-info">
								<span class="company">Apple Inc.</span>
								<span class="value inv-red">93.40</span>
								<span class="change"><i class="fa fa-caret-down inv-red"></i> 2.81%</span>
							</div>
						</div>
						<div class="col-md-3">
							<div class="stock-info">
								<span class="company">Microsoft Corporation</span>
								<span class="value inv-red">49.83</span>
								<span class="change"><i class="fa fa-caret-down inv-red"></i> 4.01%</span>
							</div>
						</div>
						<div class="col-md-3">
							<div class="stock-info">
								<span class="company">Ford Motor Co.</span>
								<span class="value inv-green">49.83</span>
								<span class="change"><i class="fa fa-caret-up inv-green"></i> 4.01%</span>
							</div>
						</div>
						<div class="col-md-3">
							<div class="stock-info">
								<span class="company">AT&amp;T, Inc.</span>
								<span class="value inv-green">41.52</span>
								<span class="change"><i class="fa fa-caret-up inv-green"></i> 0.86%</span>
							</div>
						</div>
					</div>
					<div class="row bottom-30px">
						<div class="col-md-8">
							<ul class="nav nav-pills nav-pills-custom-minimal custom-minimal-bottom" role="tablist">
								<li class="active"><a href="index-dashboard-v4.html#actives" role="tab" data-toggle="tab"><i class="fa fa-flash"></i> Most Actives</a></li>
								<li><a href="index-dashboard-v4.html#gainers" role="tab" data-toggle="tab"><i class="fa fa-level-up"></i> Gainers</a></li>
								<li><a href="index-dashboard-v4.html#losers" role="tab" data-toggle="tab"><i class="fa fa-level-down"></i> Losers</a></li>
							</ul>
							<div class="tab-content">
								<div class="tab-pane fade in active" id="actives">
									<table class="table table-striped">
										<thead>
											<tr>
												<th>Symbol</th>
												<th>Company Name</th>
												<th>Price</th>
												<th>Change</th>
												<th>% Change</th>
												<th>Volume</th>
											</tr>
										</thead>
										<tbody>
											<tr>
												<td>BAC</td>
												<td>Bank of America Corporation</td>
												<td>13.04</td>
												<td><span class="inv-red">-1.04</span></td>
												<td><span class="inv-red">-7.41%</span></td>
												<td>239,499,186</td>
											</tr>
											<tr>
												<td>MSFT</td>
												<td>Microsoft Corporation</td>
												<td>49.83</td>
												<td><span class="inv-green">+2.08</span></td>
												<td><span class="inv-green">+4.01%</span></td>
												<td>133,502,263</td>
											</tr>
											<tr>
												<td>AAPL</td>
												<td>Apple Inc.</td>
												<td>93.40</td>
												<td><span class="inv-green">+2.70</span></td>
												<td><span class="inv-green">+2.81%</span></td>
												<td>75,311,762</td>
											</tr>
											<tr>
												<td>BAC</td>
												<td>Bank of America Corporation</td>
												<td>13.04</td>
												<td><span class="inv-red">-1.04</span></td>
												<td><span class="inv-red">-7.41%</span></td>
												<td>239,499,186</td>
											</tr>
											<tr>
												<td>MSFT</td>
												<td>Microsoft Corporation</td>
												<td>49.83</td>
												<td><span class="inv-green">+2.08</span></td>
												<td><span class="inv-green">+4.01%</span></td>
												<td>133,502,263</td>
											</tr>
										</tbody>
									</table>
								</div>
								<div class="tab-pane fade" id="gainers">
									<table class="table table-striped">
										<thead>
											<tr>
												<th>Symbol</th>
												<th>Company Name</th>
												<th>Price</th>
												<th>Change</th>
												<th>% Change</th>
												<th>Volume</th>
											</tr>
										</thead>
										<tbody>
											<tr>
												<td>AAPL</td>
												<td>Apple Inc.</td>
												<td>93.40</td>
												<td><span class="inv-green">+2.70</span></td>
												<td><span class="inv-green">+2.81%</span></td>
												<td>75,311,762</td>
											</tr>
											<tr>
												<td>MSFT</td>
												<td>Microsoft Corporation</td>
												<td>49.83</td>
												<td><span class="inv-green">+2.08</span></td>
												<td><span class="inv-green">+4.01%</span></td>
												<td>133,502,263</td>
											</tr>
											<tr>
												<td>BAC</td>
												<td>Bank of America Corporation</td>
												<td>13.04</td>
												<td><span class="inv-green">+1.04</span></td>
												<td><span class="inv-green">+7.41%</span></td>
												<td>239,499,186</td>
											</tr>
											<tr>
												<td>AAPL</td>
												<td>Apple Inc.</td>
												<td>93.40</td>
												<td><span class="inv-green">+2.70</span></td>
												<td><span class="inv-green">+2.81%</span></td>
												<td>75,311,762</td>
											</tr>
											<tr>
												<td>MSFT</td>
												<td>Microsoft Corporation</td>
												<td>49.83</td>
												<td><span class="inv-green">+2.08</span></td>
												<td><span class="inv-green">+4.01%</span></td>
												<td>133,502,263</td>
											</tr>
										</tbody>
									</table>
								</div>
								<div class="tab-pane fade" id="losers">
									<table class="table table-striped">
										<thead>
											<tr>
												<th>Symbol</th>
												<th>Company Name</th>
												<th>Price</th>
												<th>Change</th>
												<th>% Change</th>
												<th>Volume</th>
											</tr>
										</thead>
										<tbody>
											<tr>
												<td>BAC</td>
												<td>Bank of America Corporation</td>
												<td>13.04</td>
												<td><span class="inv-red">-1.04</span></td>
												<td><span class="inv-red">-7.41%</span></td>
												<td>239,499,186</td>
											</tr>
											<tr>
												<td>MSFT</td>
												<td>Microsoft Corporation</td>
												<td>49.83</td>
												<td><span class="inv-red">-2.08</span></td>
												<td><span class="inv-red">-4.01%</span></td>
												<td>133,502,263</td>
											</tr>
											<tr>
												<td>AAPL</td>
												<td>Apple Inc.</td>
												<td>93.40</td>
												<td><span class="inv-red">-2.70</span></td>
												<td><span class="inv-red">-2.81%</span></td>
												<td>75,311,762</td>
											</tr>
											<tr>
												<td>BAC</td>
												<td>Bank of America Corporation</td>
												<td>13.04</td>
												<td><span class="inv-red">-1.04</span></td>
												<td><span class="inv-red">-7.41%</span></td>
												<td>239,499,186</td>
											</tr>
											<tr>
												<td>MSFT</td>
												<td>Microsoft Corporation</td>
												<td>49.83</td>
												<td><span class="inv-red">-2.08</span></td>
												<td><span class="inv-red">-4.01%</span></td>
												<td>133,502,263</td>
											</tr>
										</tbody>
									</table>
								</div>
							</div>
						</div>
						<div class="col-md-4">
							<ul class="nav nav-pills nav-pills-custom-minimal custom-minimal-bottom" role="tablist">
								<li class="active"><a href="index-dashboard-v4.html#majors" role="tab" data-toggle="tab">Majors</a></li>
								<li><a href="index-dashboard-v4.html#americas" role="tab" data-toggle="tab">Americas</a></li>
								<li><a href="index-dashboard-v4.html#emea" role="tab" data-toggle="tab">EMEA</a></li>
							</ul>
							<div class="tab-content">
								<div class="tab-pane fade in active" id="majors">
									<table class="table table-striped">
										<thead>
											<tr>
												<th>Currency</th>
												<th>Price</th>
												<th>Change</th>
												<th>% Change</th>
											</tr>
										</thead>
										<tbody>
											<tr>
												<td>EUR/USD</td>
												<td>1.1067</td>
												<td><span class="inv-green">+0.0001</span></td>
												<td><span class="inv-green">+0.01%</span></td>
											</tr>
											<tr>
												<td>USD/JPY</td>
												<td>105.815</td>
												<td><span class="inv-red">-0.361</span></td>
												<td><span class="inv-red">-0.33%</span></td>
											</tr>
											<tr>
												<td>GBP/USD</td>
												<td>1.3238</td>
												<td><span class="inv-red">-0.0013</span></td>
												<td><span class="inv-red">-0.10%</span></td>
											</tr>
											<tr>
												<td>AUD/USD</td>
												<td>0.7543</td>
												<td><span class="inv-green">+0.3452</span></td>
												<td><span class="inv-green">+0.46%</span></td>
											</tr>
											<tr>
												<td>EUR/JPY</td>
												<td>117.068</td>
												<td><span class="inv-green">+0.0001</span></td>
												<td><span class="inv-green">+0.21%</span></td>
											</tr>
										</tbody>
									</table>
								</div>
								<div class="tab-pane fade" id="americas">
									<table class="table table-striped">
										<thead>
											<tr>
												<th>Currency</th>
												<th>Price</th>
												<th>Change</th>
												<th>% Change</th>
											</tr>
										</thead>
										<tbody>
											<tr>
												<td>USD/CAD</td>
												<td>1.2974</td>
												<td><span class="inv-green">+0.0029</span></td>
												<td><span class="inv-green">+0.22%</span></td>
											</tr>
											<tr>
												<td>USD/MXN</td>
												<td>18.4086</td>
												<td><span class="inv-green">+0.0237</span></td>
												<td><span class="inv-green">+0.13%</span></td>
											</tr>
											<tr>
												<td>USD/BRL</td>
												<td>3.2547</td>
												<td><span class="inv-red">-0.0265</span></td>
												<td><span class="inv-red">-0.81%</span></td>
											</tr>
											<tr>
												<td>USD/CLP</td>
												<td>648.7395</td>
												<td><span class="inv-red">-3.6100</span></td>
												<td><span class="inv-red">-0.55%</span></td>
											</tr>
											<tr>
												<td>USD/PEN</td>
												<td>3.2890</td>
												<td><span class="inv-green">+0.0059</span></td>
												<td><span class="inv-green">+0.18%</span></td>
											</tr>
										</tbody>
									</table>
								</div>
								<div class="tab-pane fade" id="emea">
									<table class="table table-striped">
										<thead>
											<tr>
												<th>Currency</th>
												<th>Price</th>
												<th>Change</th>
												<th>% Change</th>
											</tr>
										</thead>
										<tbody>
											<tr>
												<td>EUR/USD</td>
												<td>1.1067</td>
												<td><span class="inv-green">+0.0001</span></td>
												<td><span class="inv-green">+0.01%</span></td>
											</tr>
											<tr>
												<td>GBP/USD</td>
												<td>1.3238</td>
												<td><span class="inv-red">-0.0013</span></td>
												<td><span class="inv-red">-0.10%</span></td>
											</tr>
											<tr>
												<td>USD/CHF</td>
												<td>0.9829</td>
												<td><span class="inv-green">+0.0005</span></td>
												<td><span class="inv-green">+0.05%</span></td>
											</tr>
											<tr>
												<td>USD/PEN</td>
												<td>3.2890</td>
												<td><span class="inv-green">+0.0059</span></td>
												<td><span class="inv-green">+0.18%</span></td>
											</tr>
											<tr>
												<td>USD/CLP</td>
												<td>648.7395</td>
												<td><span class="inv-red">-3.6100</span></td>
												<td><span class="inv-red">-0.55%</span></td>
											</tr>
										</tbody>
									</table>
								</div>
							</div>
						</div>
					</div>
					<div class="row">
						<div class="col-md-4">
							<div class="market-news">
								<h3 class="heading">Top News</h3>
								<ul class="list-unstyled">
									<li>
										<a href="index-dashboard-v4.html#" class="news-thumbnail"><img src="assets/img/market-news.jpg" class="img-responsive" alt="Top News"></a>
										<a href="index-dashboard-v4.html#" class="title">Intrinsicly leverage existing state of the art metrics with integrated niche markets</a>
									</li>
									<li>
										<a href="index-dashboard-v4.html#" class="title">Enthusiastically formulate leveraged technologies</a>
									</li>
									<li>
										<a href="index-dashboard-v4.html#" class="title">Efficiently drive mission-critical applications rather than real-time</a>
									</li>
									<li>
										<a href="index-dashboard-v4.html#" class="title">Proactively harness backward-compatible core competencies with fully</a>
									</li>
									<li>
										<a href="index-dashboard-v4.html#" class="title">Credibly drive sustainable networks</a>
									</li>
								</ul>
							</div>
						</div>
						<div class="col-md-4">
							<div class="market-news">
								<h3 class="heading">Economy</h3>
								<ul class="list-unstyled">
									<li>
										<a href="index-dashboard-v4.html#" class="news-thumbnail"><img src="assets/img/market-news2.jpg" class="img-responsive" alt="Top News"></a>
										<a href="index-dashboard-v4.html#" class="title">Conveniently communicate transparent markets for transparent testing procedures</a>
									</li>
									<li>
										<a href="index-dashboard-v4.html#" class="title">Holisticly aggregate an expanded array of synergy</a>
									</li>
									<li>
										<a href="index-dashboard-v4.html#" class="title">Assertively incubate backward-compatible niche markets without focused sources</a>
									</li>
									<li>
										<a href="index-dashboard-v4.html#" class="title">Conveniently pursue mission-critical relationships through error-free innovation</a>
									</li>
									<li>
										<a href="index-dashboard-v4.html#" class="title">Assertively implement value-added scenarios whereas global action items</a>
									</li>
								</ul>
							</div>
						</div>
						<div class="col-md-4">
							<div class="market-news">
								<h3 class="heading">Finance</h3>
								<ul class="list-unstyled">
									<li>
										<a href="index-dashboard-v4.html#" class="news-thumbnail"><img src="assets/img/market-news3.jpg" class="img-responsive" alt="Top News"></a>
										<a href="index-dashboard-v4.html#" class="title">Quickly conceptualize enabled human capital </a>
									</li>
									<li>
										<a href="index-dashboard-v4.html#" class="title">Globally enable collaborative manufactured products</a>
									</li>
									<li>
										<a href="index-dashboard-v4.html#" class="title">Completely monetize resource maximizing imperatives</a>
									</li>
									<li>
										<a href="index-dashboard-v4.html#" class="title">Holisticly mesh robust channels with emerging capital</a>
									</li>
									<li>
										<a href="index-dashboard-v4.html#" class="title">Globally evisculate high-payoff</a>
									</li>
								</ul>
							</div>
						</div>
					</div>
				</div>
			</div>
			<!-- /main -->
			{{ template "_footer.tpl" }}
		</div>
		<!-- END CONTENT WRAPPER -->
	</div>
	<!-- END WRAPPER -->
	<!-- STYLE SWITCHER -->
	<div class="del-style-switcher">
		<div class="del-switcher-toggle toggle-hide"></div>
		<form>
			<section class="del-section del-section-skin">
				<h5 class="del-switcher-header">Choose Skins:</h5>
				<ul>
					<li><a href="index-dashboard-v4.html#" title="Slate Gray" class="switch-skin slategray" data-skin="assets/css/skins/slategray.css">Slate Gray</a></li>
					<li><a href="index-dashboard-v4.html#" title="Dark Blue" class="switch-skin darkblue" data-skin="assets/css/skins/darkblue.css">Dark Blue</a></li>
					<li><a href="index-dashboard-v4.html#" title="Dark Brown" class="switch-skin darkbrown" data-skin="assets/css/skins/darkbrown.css">Dark Brown</a></li>
					<li><a href="index-dashboard-v4.html#" title="Light Green" class="switch-skin lightgreen" data-skin="assets/css/skins/lightgreen.css">Light Green</a></li>
					<li><a href="index-dashboard-v4.html#" title="Orange" class="switch-skin orange" data-skin="assets/css/skins/orange.css">Orange</a></li>
					<li><a href="index-dashboard-v4.html#" title="Red" class="switch-skin red" data-skin="assets/css/skins/red.css">Red</a></li>
					<li><a href="index-dashboard-v4.html#" title="Teal" class="switch-skin teal" data-skin="assets/css/skins/teal.css">Teal</a></li>
					<li><a href="index-dashboard-v4.html#" title="Yellow" class="switch-skin yellow" data-skin="assets/css/skins/yellow.css">Yellow</a></li>
				</ul>
				<div id="transparent-control"></div>
				<button type="button" class="switch-skin-full fulldark" data-skin="assets/css/skins/fulldark.css">Full Dark</button>
				<button type="button" class="switch-skin-full fullbright" data-skin="assets/css/skins/fullbright.css">Full Bright</button>
			</section>
			<p><a href="index-dashboard-v4.html#" title="Reset Style" class="del-reset-style">Reset Style</a></p>
		</form>
		<script type="text/javascript">
		var currentFilename = window.location.pathname.split('/').pop();
		if (currentFilename == '') currentFilename = 'index.html';

		var arrHasTransparent = ['index.html', 'index-dashboard-v2.html', 'charts-statistics-interactive.html', 'charts-statistics-real-time.html',
			'charts-statistics.html', 'components-maps.html', 'components-tree-view.html', 'page-file-manager.html'
		];

		var hasTransparent = false;

		arrHasTransparent.forEach(function(filename) {
			if (filename == currentFilename) {
				hasTransparent = true;
				return;
			}
		});

		if (hasTransparent) {
			document.getElementById("transparent-control").innerHTML = '<p><em>There is specific transparent version for this page, check <span class="important">&larr; left</span> navigation menu</em></p><br>';
		} else {
			document.getElementById("transparent-control").innerHTML = '<button type="button" class="switch-skin-full transparent" data-skin="assets/css/skins/transparent.css">Transparent</button>';
		}
		</script>
	</div>
	<!-- END STYLE SWITCHER -->
	<!-- Javascript -->
	<script src="assets/js/jquery/jquery-2.1.0.min.js"></script>
	<script src="assets/js/bootstrap/bootstrap.js"></script>
	<script src="assets/js/plugins/modernizr/modernizr.js"></script>
	<script src="assets/js/plugins/bootstrap-tour/bootstrap-tour.custom.js"></script>
	<script src="assets/js/plugins/jquery-slimscroll/jquery.slimscroll.min.js"></script>
	<script src="assets/js/king-common.js"></script>
	<script src="demo-style-switcher/assets/js/deliswitch.js"></script>
	<script src="assets/js/plugins/jquery-slimscroll/jquery.slimscroll.min.js"></script>
	<script src="assets/js/plugins/stat/flot/jquery.flot.min.js"></script>
	<script src="assets/js/plugins/stat/flot/jquery.flot.pie.min.js"></script>
	<script src="assets/js/king-chart-stat.js"></script>
</body>

</html>
