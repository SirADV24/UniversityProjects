# Substitute the i-th element from a list, with a value v.

class Node:
	def __init__(self, value, next=None):
		self.value = value
		self.next = next




def changeIthElement(Node , i, v):
	if Node == None:
		return
	if i == 0:
		Node.value = v
	else:
		changeIthElement(Node.next, i-1, v)


def main():
	n4 = Node(4)
	n3 = Node(3, n4)
	n2 = Node(2, n3)
	n1 = Node(1, n2)

	changeIthElement(n1, 2, 100)

	for node in [n1, n2, n3, n4]:
		print(node.value, end=" ")

	print("\n")



if __name__ == "__main__":
	main()
