#include <iostream>
#include <fstream>
#include <cstdlib>
#include <string>
#include <bitset>
#include <iomanip>


int main()
{	
	srand((int)time(0));

	std::ofstream fout;
	fout.open("challenges.txt");
	

	for(int iter=0;iter<32;iter++)
	{
		//generate 8 random numbers betwwen 0 and 255
		//turn number into binary number
		unsigned int numArray[8];

		//generate 8, 8 bit decimal numbers
		for(int i =0; i<8; i++)
		{
			numArray[i] = (rand() % 255) + 1;
			std::cout<<numArray[i]<<std::endl;
		}

		//Change to binary number
		for(int i=0; i<8;i++)
		{
			fout << std::setfill('0')<<std::setw(sizeof(char)*2) << std::hex<<numArray[i] <<" ";
		
		}
		fout << std::endl;
	}
	fout.close();
	
	return 0;
}
