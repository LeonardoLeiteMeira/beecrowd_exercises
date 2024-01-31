class ListNode<T> {
  T value;
  ListNode<T>? next;

  ListNode(this.value) : next = null;
}

ListNode<int>? solution(ListNode<int>? l) {
  ListNode<int>? previus;
  var current = l;
  var next = l?.next;

  while (current != null) {
    current.next = previus;

    previus = current;
    current = next;
    next = next?.next;
  }

  return previus;
}

void main(List<String> args) {
  ListNode<int>? l = ListNode(1);
  l.next = ListNode(2);
  l.next?.next = ListNode(3);
  l.next?.next?.next = ListNode(4);
  l.next?.next?.next?.next = ListNode(5);
  l.next?.next?.next?.next?.next = ListNode(6);
  l.next?.next?.next?.next?.next?.next = ListNode(7);
  l.next?.next?.next?.next?.next?.next?.next = ListNode(8);
  l.next?.next?.next?.next?.next?.next?.next?.next = ListNode(9);
  l.next?.next?.next?.next?.next?.next?.next?.next?.next = ListNode(10);
  l.next?.next?.next?.next?.next?.next?.next?.next?.next?.next = ListNode(11);
  l.next?.next?.next?.next?.next?.next?.next?.next?.next?.next?.next =
      ListNode(12);
  l.next?.next?.next?.next?.next?.next?.next?.next?.next?.next?.next?.next =
      ListNode(13);
  l.next?.next?.next?.next?.next?.next?.next?.next?.next?.next?.next?.next
      ?.next = ListNode(14);
  l.next?.next?.next?.next?.next?.next?.next?.next?.next?.next?.next?.next?.next
      ?.next = ListNode(15);
  l.next?.next?.next?.next?.next?.next?.next?.next?.next?.next?.next?.next?.next
      ?.next?.next = ListNode(16);
  l.next?.next?.next?.next?.next?.next?.next?.next?.next?.next?.next?.next?.next
      ?.next?.next?.next = ListNode(17);

  var result = solution(l);

  while (result != null) {
    print(result.value);
    result = result.next;
  }
}
