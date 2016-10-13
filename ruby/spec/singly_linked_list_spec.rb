# require_relative '../lib/singly_linked_list'
#
# describe SinglyLinkedList do
#
#   describe '::new' do
#     let!(:node) { Node.new('node') }
#     it 'takes an argument (for the head attribute)' do
#         expect(SinglyLinkedList).to respond_to(:new).with(1).argument # TODO passing early
#     end
#     context 'when argument for head is a Node' do
#       subject(:node_head_list) { SinglyLinkedList.new(node) }
#       it 'sets the head instance variable to the argument' do
#         expect(node_head_list).to be_a SinglyLinkedList
#         expect(node_head_list.head).to eq node
#       end
#     end
#     context 'when argument for head is nil' do
#       subject(:nil_head_list) { SinglyLinkedList.new(nil) }
#       it 'sets the head instance variable to the argument' do
#         expect(nil_head_list).to be_a SinglyLinkedList
#         expect(nil_head_list.head).to be_nil
#       end
#     end
#     context 'when argument for head is not a Node or nil' do
#       subject(:list) { SinglyLinkedList.new(14) }
#       it 'creates a new node for the head with the argument as data' do
#         expect(list).to be_a SinglyLinkedList
#         expect(list.head).to be_a Node
#         expect(list.head.data).to eq 14
#       end
#     end
#     it 'sets the head to nil if no head is provided' do
#       expect(SinglyLinkedList.new.head).to be_nil
#     end
#   end
#
#   describe '#head' do
#     let!(:node) { Node.new 'some data' }
#     subject(:list) { SinglyLinkedList.new node }
#     it 'allows getting a head' do
#       expect(list).to respond_to(:head)
#       expect(list.head).to be_a(Node)
#       expect(list.head).to eq(node)
#     end
#   end
#
#   describe '#head=' do
#     let!(:node) { Node.new 123 }
#     let!(:other_node) { Node.new 456 }
#     subject(:list) { SinglyLinkedList.new node }
#     it 'allows setting head to nil' do
#       expect{ list.head=nil }.to change{ list.head }.from(node).to(nil)
#     end
#     it 'allows setting head to a node' do
#       expect{ list.head=other_node }.to change { list.head }.to(other_node)
#     end
#     it 'raises an ArugmentErorr if the head is set to anyting other than nil or a node' do
#       expect{ list.head=7 }.to raise_error ArgumentError
#     end
#   end
#
#   describe '#inspect' do
#     # format data1.inspect (head) -> datb.inspect -> data3.inspect
#     let(:node) { Node.new 123 }
#     let(:other_node) { Node.new 456 }
#     let(:node_b) { Node.new 'b' }
#     subject(:empty_list) { SinglyLinkedList.new nil }
#     subject(:list) { SinglyLinkedList.new node }
#     it 'returns a human-readable string version of the list' do
#       expect(list.inspect).to eq('123 (head) -> nil')
#       node.next=other_node
#       other_node.next=node_b
#       expect(list.inspect).to eq('123 (head) -> 456 -> b -> nil')
#     end
#     it 'handles empty lists' do
#       expect(empty_list.inspect).to eq('nil (head)')
#     end
#   end
#
#   describe '#empty?' do
#     context 'when head of the list is nil' do
#       subject(:list) { SinglyLinkedList.new(nil) }
#       it 'returns true' do
#         expect(list.empty?).to be true
#       end
#     end
#     context 'when head of the list is not nil' do
#       let(:node) { Node.new(1) }
#       subject(:list) { SinglyLinkedList.new(node) }
#       it 'returns false' do
#         expect(list.empty?).to be false
#       end
#     end
#   end
#
#   describe '#length' do
#     let(:node_a) { Node.new 'a' }
#     let(:node_b) { Node.new 'b' }
#     subject(:list) { SinglyLinkedList.new nil }
#     it 'returns 0 for an empty list' do
#       expect(list.length).to eq 0
#     end
#     it 'returns the number of nodes in the list' do
#       node_a.next = node_b
#       list.head = node_a
#       expect(list.length).to eq 2
#     end
#   end
#
#   describe '#append' do
#     let(:node_a) { Node.new 'a' }
#     let(:node_b) { Node.new 'b' }
#     subject(:list) { SinglyLinkedList.new node_a }
#     # takes in data for a new node
#     # appends either to the list
#     # sets a new tail for the list (bonus)
#     # if the list was empty, sets a new head for the list
#     it 'takes in data for the new node' do
#       expect(list).to respond_to(:append).with(1).argument
#     end
#     it 'increases the length of the list by 1' do
#       expect{ list.append(7) }.to change{ list.length }.from(1).to(2)
#       expect{ list.append(node_b) }.to change{ list.length }.from(2).to(3)
#     end
#     #  it 'sets the newly added node as the tail of the list' do
#     #  #  bonus
#     #  end
#     context 'when list is empty' do
#       let(:node) { Node.new 'b' }
#       subject(:list) { SinglyLinkedList.new nil }
#       it 'sets the newly added node as the head of the list' do
#         expect{ list.append node }.to change{ list.head }.from(nil).to(node)
#       end
#     end
#   end
#
#   describe '#insert_at_start' do
#     let(:node_a) { Node.new 'a' }
#     let(:node_b) { Node.new 'b' }
#     subject(:list) { SinglyLinkedList.new node_a }
#     it 'takes in an argument (for the new node)' do
#       expect(list).to respond_to(:insert_at_start).with(1).argument
#     end
#     it 'increases the length of the list by 1' do
#       expect{ list.insert_at_start(7) }.to change{ list.length }.from(1).to(2)
#       expect{ list.insert_at_start(node_b) }.to change{ list.length }.from(2).to(3)
#     end
#     it 'sets the head of the linked list to be the new node' do
#       expect{ list.insert_at_start(node_b) }.to change{ list.head }.from(node_a).to(node_b)
#       expect{ list.insert_at_start(10) }.to change{ list.head.data }.from('b').to(10)
#     end
#     it 'uses the old head as the next node for the new node' do
#       expect{ list.insert_at_start(node_b) }.to change{ node_b.next }.from(nil).to(node_a)
#       expect{ list.insert_at_start(10) }.to change{ list.head.next }.from(node_a).to(node_b)
#     end
#     # context 'when list is empty' do
#     #   it 'sets the tail of the list to be the new node' do
#     #
#     #   end
#     # end
#   end
#
#   describe '#data_exists?' do
#     let(:node_a) { Node.new 'a' }
#     subject(:list) { SinglyLinkedList.new node_a }
#     it 'takes in an argument (for the data to match)' do
#       expect(list).to respond_to(:data_exists?).with(1).argument
#     end
#     it 'returns true if the list has a node with that data' do
#       expect(list.data_exists? 'a').to be true
#     end
#     it 'returns false if the list does not have a node with that data' do
#       expect(list.data_exists? 'not there').to be false
#     end
#   end
#
#   describe '#node_exists?' do
#     let(:node_a) { Node.new 'a' }
#     let(:node_b) { Node.new 'b' }
#     let(:node_c) { Node.new 'c' }
#     subject(:list) { SinglyLinkedList.new node_a }
#     it 'takes in an argument (for the node to match)' do
#       expect(list).to respond_to(:node_exists?).with(1).argument
#     end
#     it 'returns true if the list includes that node' do
#       list.append node_b
#       list.append node_c
#       expect(list.node_exists? node_a).to be true
#       expect(list.node_exists? node_b).to be true
#       expect(list.node_exists? node_c).to be true
#     end
#     it 'returns false if the list does not include that node' do
#       expect(list.node_exists? Node.new('not there')).to be false
#     end
#   end
#
#   describe '#delete' do
#     let(:node_a) { Node.new 'a' }
#     let(:node_b) { Node.new 'b' }
#     subject(:list) { SinglyLinkedList.new node_a }
#     it 'takes in an argument (for the node to delete)' do
#       expect(list).to respond_to(:delete).with(1).argument
#     end
#     it 'removes one node' do
#       expect{ list.delete(node_a) }.to change{ list.length }.from(1).to(0)
#     end
#     it 'updates head if needed' do
#       list.append node_b
#       expect {list.delete(node_a)}.to change{ list.head }.from(node_a).to(node_b)
#     end
#   end
#
#   describe '#delete_with_data' do
#     let(:node_a) { Node.new 'a' }
#     let(:node_b) { Node.new 'b' }
#     subject(:list) { SinglyLinkedList.new node_a }
#     it 'takes in an argument (for the node to delete)' do
#       expect(list).to respond_to(:delete_with_data).with(1).argument
#     end
#     it 'reduces the length of the list by 1' do
#       expect{ list.delete_with_data('a') }.to change{ list.length }.from(1).to(0)
#     end
#     it 'updates head if needed' do
#       list.append node_b
#       expect {list.delete_with_data('a')}.to change{ list.head }.from(node_a).to(node_b)
#     end
#   end
#
#   describe '#remove_from_end' do
#     context 'non-empty list' do
#       let(:node_1) { Node.new 1 }
#       let(:node_2) { Node.new 2 }
#       let(:node_3) { Node.new 3 }
#       subject(:list) { SinglyLinkedList.new node_1 }
#
#       it 'reduces the length of the list by 1' do
#         node_1.next = node_2
#         node_2.next = node_3
#         expect{ list.remove_from_end }.to change{ list.length }.from(3).to(2)
#       end
#       it 'removes the last node from the list' do
#         node_1.next = node_2
#         node_2.next = node_3
#         list.remove_from_end
#         expect(list.node_exists?(node_1)).to be true
#         expect(list.node_exists?(node_2)).to be true
#       end
#       it 'updates the head if needed' do
#         expect{list.remove_from_end}.to change{list.head}.from(node_1).to(nil)
#       end
#     end
#     context 'empty list' do
#       let(:empty_list) { SinglyLinkedList.new(nil) }
#       it 'has no effect on empty lists' do
#         expect{empty_list.remove_from_end}.not_to change{ empty_list }
#       end
#     end
#   end
#
#   describe '#remove_from_start' do
#     context 'non-empty list' do
#       let(:node_1) { Node.new 1 }
#       let(:node_2) { Node.new 2 }
#       let(:node_3) { Node.new 3 }
#       subject(:list) { SinglyLinkedList.new node_1 }
#
#       it 'reduces the length of the list by 1' do
#         node_1.next = node_2
#         node_2.next = node_3
#         expect{ list.remove_from_start }.to change{ list.length }.from(3).to(2)
#       end
#       it 'removes the first node from the list' do
#         node_1.next = node_2
#         node_2.next = node_3
#         list.remove_from_start
#         expect(list.node_exists?(node_2)).to be true
#         expect(list.node_exists?(node_3)).to be true
#       end
#       it 'updates the head' do
#         node_1.next = node_2
#         expect{list.remove_from_start}.to change{list.head}.from(node_1).to(node_2)
#       end
#     end
#     context 'empty list' do
#       let(:empty_list) { SinglyLinkedList.new(nil) }
#       it 'has no effect on empty lists' do
#         expect{empty_list.remove_from_start}.not_to change{ empty_list }
#       end
#     end
#   end
#
#   describe '#middle_node' do
#     let(:node_1) { Node.new 1 }
#     let(:node_2) { Node.new 2 }
#     let(:node_3) { Node.new 3 }
#     let(:node_4) { Node.new 4 }
#     let(:node_5) { Node.new 5 }
#     subject(:even_length_list) { SinglyLinkedList.new node_1 }
#     subject(:odd_length_list) { SinglyLinkedList.new node_1 }
#     subject(:empty_list) { SinglyLinkedList.new(nil) }
#
#     it 'returns the node in the middle of the list for odd-length lists' do
#       node_1.next = node_2
#       node_2.next = node_3
#       node_3.next = node_4
#       node_4.next = node_5
#       expect(odd_length_list.middle_node).to eq(node_3)
#     end
#     it 'returns the left-middle node in even-length lists' do
#       node_1.next = node_2
#       node_2.next = node_3
#       node_3.next = node_4
#       expect(even_length_list.middle_node).to eq(node_2)
#     end
#     it 'returns nil for empty lists' do
#       expect(empty_list.middle_node).to be_nil
#     end
#   end
#
# end
