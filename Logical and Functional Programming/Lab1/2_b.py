
# Determine difference of two sets represented as lists.

def gcd_list(List):
	

class Node:
	def __init__(self, value, next=None):
		self.value = value
		self.next = next

def insert(VAL, List, POS):
	if POS == 1:
		new_node = Node(VAL, List.next)
		List.next = new_node
	else:
		insert(VAL, List.next, POS - 1)

def main():
	n4 = Node(4)
	n3 = Node(3, n4)
	n2 = Node(2, n3)
	n1 = Node(1, n2)

	insert(5, n1, 2)
	node = n1
	while(node):
		print(node.value, end=" ")
		node = node.next
	print("\n")



if __name__ == "__main__":
	main()
