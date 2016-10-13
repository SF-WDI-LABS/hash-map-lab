require_relative '../lib/node'

# describe Node do
#   let!(:node) { Node.new('hello') }
#
#   describe '::new' do
#     it 'sets data instance variable based on argument' do
#       expect(node.data).to eq('hello')
#     end
#     it 'raises an ArgumentError if argument is nil' do
#       expect { Node.new(nil) }.to raise_error ArgumentError
#     end
#     it 'sets next instance variable to nil' do
#       expect(node.next).to be_nil
#     end
#   end
#   describe '#data' do
#     it 'allows accessing data' do
#       expect(node).to respond_to(:data)
#       expect(node.data).to eq('hello')
#     end
#   end
#
#   describe '#data=' do
#     it 'takes in an argument' do
#       expect(node).to respond_to(:data=).with(1).argument
#     end
#     it 'sets data to the argument if it is not nil' do
#       node.data = 4
#       expect(node.data).to eq(4)
#     end
#     it 'raises an ArgumentError if the argument is nil' do
#       expect { node.data=nil }.to raise_error ArgumentError
#     end
#   end
#
#   describe '#next' do
#     it 'allows accessing next' do
#       expect(node).to respond_to(:next)
#     end
#   end
#
#   describe '#next=' do
#     let!(:other_node) { Node.new('other node') }
#     it 'takes in an argument' do
#       expect(node).to respond_to(:next=).with(1).argument
#     end
#     it 'sets next if arugment is a Node or is nil' do
#       expect { node.next=other_node }.to change{node.next}.from(nil).to(other_node)
#       expect { node.next=nil }.to change{node.next}.to(nil)
#     end
#     it 'raises an ArgumentError if next is not either a Node or nil' do
#       expect { node.next=8 }.to raise_error ArgumentError
#     end
#   end
# end
