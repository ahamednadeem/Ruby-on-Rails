class HomeController < ApplicationController
  def index
    @welcome = "WELCOME TO USER MANAGEMENT SYSTEM"
  end

  def about
    @aboutme = "Hey there! I'm Ahamed Nadeem, a 21-year-old currently based in Chennai, originally from the vibrant city of Erode. Currently, I'm diving into the world of programming, honing my skills as an intern at Mobicip in Bangalore. I have a passion for problem-solving, whether it's unraveling the complexities of a Rubik's Cube or delving into the intricacies of coding. When I'm not immersed in lines of code, you can find me lost in the rhythm of music, finding solace and inspiration in its melodies. I'm currently exploring the realm of web development, particularly focusing on mastering the ins and outs of Rails. With a curious mind and a drive for learning, I'm eager to carve out my path in the ever-evolving landscape of technology."
  end
end
