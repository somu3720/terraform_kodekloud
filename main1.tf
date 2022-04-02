resource "local_file" "top10" {
    filename = "/root/anime/top10.txt"
    content  = "1. Naruto\n2. DragonBallZ\n3. Death Note\nFullmetal Alchemist\nOne-Punch Man\n"
  
}
resource "local_file" "hall_of_fame" {
  filename = "/root/anime/hall-of-fame.txt"
  content = "1.Attack On Titan\n2. Naruto\n3. Bleach\n"

}
resource "local_file" "new_shows" {
  filename = "/root/anime/new_shows.txt"
  content = "1. Cannon Busters\n2. Last Hope\n3. Lost Song\n"

}
resource "local_file" "classics" {
  filename = "/root/anime/classic_shows.txt"
  content = "1. DragonBall\n"

}
