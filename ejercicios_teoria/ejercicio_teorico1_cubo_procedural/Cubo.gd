extends MeshInstance

var size = 0.5
var vertices := PoolVector3Array([
	Vector3(-size,-size,size), Vector3(size,-size,size), 
	Vector3(-size,size,size), Vector3(size,size,size),
	Vector3(-size,-size,-size), Vector3(size,-size,-size),
	Vector3(-size,size,-size), Vector3(size,size,-size)])

var indices :=  PoolIntArray([
	0,1,3, 0,3,2, 
	5,4,6, 5,6,7, 
	1,5,7, 1,7,3, 
	4,0,2 ,4,2,6,
	7,6,2, 7,2,3, 
	4,5,1, 4,1,0])

var arr := []


func _ready():
	self.mesh = Mesh.new()
	arr.resize(Mesh.ARRAY_MAX)
	arr[Mesh.ARRAY_VERTEX] = vertices
	arr[Mesh.ARRAY_INDEX] = indices
	mesh.add_surface_from_arrays(Mesh.PRIMITIVE_TRIANGLES, arr)

func _process(delta):
	rotate_y(0.5*delta)

