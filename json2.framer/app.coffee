# Project Info
# This info is presented in a widget when you share.
# http://framerjs.com/docs/#info.info

Framer.Info =
	title: ""
	author: "Sebastian Drew"
	twitter: ""
	description: ""



Canvas.backgroundColor = "#000"
Screen.backgroundColor = 
	"#FFF"
list = new Layer
	size: Screen.size
	backgroundColor: null
	
data = JSON.parse Utils.domLoadDataSync "data/file.json"
users = data["users"]

topBar = new Layer
	width: Screen.width
	height: 128
	backgroundColor: 'rgba(240, 240, 240, 0.4)'
	borderColor: "#CCC"
	borderWidth: 1
	opacity: 1
	html: """
		<style>
		ttl {
			width: 750px;
			display: block;
			padding-top: 45px;
			color: #335555;
			font-size: 40px;
			font-weight: 800;
			text-align: center;
			}
		</style>
		<ttl>Contacts</ttl>
		"""
topBar.style = 
	"box-shadow" : "0px 4px 3px rgba(0,0,0,0.03)"

for user, i in users
	name = user.name
	role = user.role
	image = user.image
	
	panel = new Layer
		width: Screen.width - 40
		superLayer: list
		height: 200
		x: Align.right
		y: 206*i
		html: """
			<style>
			user {
			font-family: SFUIText-Light;
			font-size: 45px;
			color: #888;
			display: block;
			padding-top: 30px;
			padding-left: 30px;
			}
			role {
			font-family: SFUIText-Light;
			display: block;
			font-size: 35px;
			color: #888;
			padding-left: 30px;
			}
			thumb {
				font-size: 35px;
				color: #888;
				background-image: url("#{image}");
				background-size: cover;
				background-repeat: no-repeat;
				background-position: center;
				width: 110px;
				height: 110px;
				float: left;
				dispay: block;
				border-radius: 50%;
				border: 6px solid #EEE;
				margin: 40px 0 0 20px;
				background-color: #DEE;
			}
			txt {
				width: 540px;
				float: left;
				margin: 30px 0 0 0;
			}
			</style>
			<thumb></thumb>
			<txt>
			<user>#{name}</user>
			<br />
			<role>#{role}</role>
			</txt>
			"""
	panel.style = 
	"background-color": "#FFF"
	"border-bottom" : "1px solid #CCC"
	thumb = new Layer
		superLayer: panel
		height: 120
		width: 120
		x: 22
		y: 40
		image: "#{image}"
		borderRadius: 100
		borderColor: "#EEE"
		borderWidth: 5

			
			
scroll = ScrollComponent.wrap(list)
scroll.speedX = 0

scroll.contentInset = 
	top: 134
	bottom: 6
	

