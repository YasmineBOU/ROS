import glob, os
import rospy
from nav_msgs.msg import Odometry
from tf.transformations import euler_from_quaternion
from geometry_msgs.msg import Point, Twist

from Ball_Detector import Ball_Detector

x, y, theta = 0.0 , 0.0, 0.0
lastImageProcessed = ""


def getLastImageSaved(imageRootPath):
	try:
		filePath = max(glob.iglob(imageRootPath + "/*"), key = os.path.getctime)
		return filePath

	except:
		return None	

def ballDetected():
	filePath = getLastImageSaved(
		imageRootPath = "/tmp/ROSCamera"
	)

	if not filePath: 
		print("No image captured found !")
		return (None, None)

	global lastImageProcessed
	if lastImageProcessed == filePath: return (None, None) 
	
	lastImageProcessed = filePath

	app = Ball_Detector({
		"filePath"	 : filePath,
		"objectColor": "blue"#"red"
	})

	return app.main()


def newOdom(msg):

	global x
	global y
	global theta

	x = msg.pose.pose.position.x
	y = msg.pose.pose.position.y

	rot_q = msg.pose.pose.orientation
	roll, pitch, theta = euler_from_quaternion([
		rot_q.x,
		rot_q.y,
		rot_q.z,
		rot_q.w,
	])


def rotateRobot(ballCenterCoords, w, h):
	x, y = ballCenterCoords


	xf = 0 if x < (w / 2) else 1
	yf = 1 if y < (h / 2) else 0

	return (xf, yf)



if __name__ == "__main__":

	rospy.init_node("speed_controller")
	sub = rospy.Subscriber("/odometry/filtered", Odometry, newOdom)
	pub = rospy.Publisher("/cmd_vel", Twist, queue_size=1)

	xSpeedMin, x = 0.5, 0.5 
	zRotMin, z = 0.3, 0.5

	wImage, hImage = 320, 240 

	speed = Twist()
	r = rospy.Rate(4)
	while not rospy.is_shutdown():

		print("\nCoords:\tspeed: ({}, {}, {})\trotation: ({}, {}, {})".format(
			speed.linear.x,
			speed.linear.y,
			speed.linear.z,
			speed.angular.x,
			speed.angular.y,
			speed.angular.z
		))
		ballCoords = ballDetected()
		if ballCoords == (None, None):
			speed.linear.x  = 0.0
			speed.angular.z = 0.61
			# speed.angular.y = -0.45
			x = xSpeedMin
			# z += 0.01

		else:
			# x = 0.5
			xRobot, yRobot = rotateRobot(ballCoords, wImage, hImage)
			speed.linear.x  = 1.3
			# speed.linear.y  = x
			# speed.linear.z  = x
			# speed.angular.y = 0.0
			# speed.angular.z = 0.0
			# speed.linear.x  = -0.5 if not yRobot else 0.5
			# speed.linear.y  = -0.5 if not xRobot else 0.5
			speed.angular.z  = 0.1 if not xRobot else -0.1
			speed.angular.y  = 0.1 if not yRobot else -0.1

			print("\n\nBALL DETECTED !\t ballCoords: {}\trobotDir: ({}, {})".format(
				ballCoords, 
				xRobot, 
				yRobot
			))
			# x += 0.25
			# z = zRotMin


		pub.publish(speed)
		r.sleep()
