# Project Info
# This info is presented in a widget when you share.
# http://framerjs.com/docs/#info.info

Framer.Info =
	title: ""
	author: "Sebastian Drew"
	twitter: ""
	description: ""


# Import file "json" (sizes and positions are scaled 1:2)
sketch = Framer.Importer.load("imported/json@2x")

scroll = new ScrollComponent(wrap: sketch.scrollLayer)
scroll.scrollHorizontal = false

scroll.contentInset = 
	bottom: 14

new BackgroundLayer backgroundColor:  "#EBEBEB"

data = JSON.parse Utils.domLoadDataSync "data/file.json"
users = data["users"]

for user, i in users
	name = user.name
	role = user.role
	
	sketch.scrollLayer.children[i].children[1].props =
		width: 10000000
		html: """
		<style>
		/* User Uservich: */
		user {
		font-family: SFUIText-Heavy;
		font-size: 48px;
		color: #F00;
		letter-spacing: 0;
		}
		</style>
		
		<user>Hello #{user.name}<br />
		<role>#{user.role}</role>
		"""
	


