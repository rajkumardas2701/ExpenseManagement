module GroupsHelper
  def image_generator1
    'https://cdn4.iconfinder.com/data/icons/people-std-pack/512/customers-512.png'
  end

  def group_img(img)
    img || image_generator1
  end
end
