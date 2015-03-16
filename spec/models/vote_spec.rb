require 'rails_helper'


     
 

describe Vote do
  describe "validations" do
    describe "value validation" do
      before do
       user = User.create
       topic = Topic.create
       @post = Post.create(title: 'post title', body: 'post body must be pretty long',user: user, topic: topic)
       @post.votes.create(value: 5) 
       
     end
      
      it "only allows -1 or 1 as values" do
        expect(@post.valid?).to eq(false)
        
      end
    end
  end
end