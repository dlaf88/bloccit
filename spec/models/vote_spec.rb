describe Vote do
  describe "validations" do
    describe "value validation" do
      it "only allows -1 or 1 as values" do
        
        before do
       @post = Post.create(title: 'post title', body: 'post body')
       3.times { @post.votes.create(value: 1) }
       2.times { @post.votes.create(value: -1) }       
        end
 
        
      end
    end
  end
end