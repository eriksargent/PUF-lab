#include <iostream>
#include <fstream>
#include <string>
#include <sstream>
#include <iomanip>

/***********************************
*Reads in two files, challenges.txt and
*responses.txt. Each contains 32
*challenges/responses. The Hamming Distance
*is computed and the the output is sent to
*results.txt*
***********************************/


int HD(unsigned int a, unsigned int b);
int main()
{
  //File containing challenges
  std::ifstream challenges("challenges.txt");
  //File containing responses
  std::ifstream responses("responses.txt");
  //File containing results
  std::ofstream results("results.txt");

  for(int i=0;i<32;i++)
  {
  	int dist =0;
	unsigned int challenge = 0;
	unsigned int response = 0;
	for(int j=0;j<8;j++)
	{
		std::string c, r;
		challenges >> c;
		responses >> r;

		std::istringstream buf1(c);
		std::istringstream buf2(r);

		buf1 >> std::hex >> challenge;
		buf2 >> std::hex >> response;

	   dist += HD(challenge, response);
	}
	double percentage = dist;
	percentage = (percentage/64)*100;
	results << "Response: "<< i <<" Has "<<dist<<" bits differing, equaling "<<std::setprecision(2)<<std::fixed<<percentage<<"%"<<std::endl;
  }

	return 0;
}

int HD(unsigned int a, unsigned int b)
{
	int val = a^b;
	int dist = 0;
	while(val!=0)
	{
		val = val & (val-1);
		dist++;
	}
	return dist;
}
