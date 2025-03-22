#include <stdio.h>
#include <stdlib.h>
int i;
int j;
FILE *file;
long file_size;
char *buffer;
signed short a[7][7];
const char *filename = "a64.bin";

int main() {
	// Open the file in binary read mode
	file = fopen(filename, "rb");
	if (file == NULL) {
        perror("Error opening file");
        return 1;
  }
	// Get the file size
  fseek(file, 0, SEEK_END);
  file_size = ftell(file);
  rewind(file);

  // Allocate memory for the buffer
  buffer = (char*)malloc(file_size * sizeof(char));
	printf("file_size = %d\n",file_size);
  if (buffer == NULL) {
      perror("Memory allocation failed");
      fclose(file);
      return 1;
   }

   // Read data into the buffer
   size_t bytes_read = fread(buffer, sizeof(char), file_size, file);
   if (bytes_read != file_size) {
   		perror("Error reading file");
    	free(buffer);
      fclose(file);
      //return 1;
   }
	for(j=0;j<8;j++) {
		for(i=0;i<8;i++) {
			a[j][i]=*buffer;
			//printf("0x%x ",a[j][i]);
			printf("%d ",a[j][i]);
			buffer+=1;
		}
		printf("\n");
		buffer+=56;
	}
	/*
	a[j][i] =   a[j][i] -  (a[j][i] + a[j][i+1] + 2 )>>2;
	a[j][i] =   a[j][i] -  (a[j][i-1] + a[j][i+1] + 2 )>>2;
	a[j][i] =   a[j][i] -  (a[j][i+1] + a[j][i+1] + 2 )>>2;
	-50 12 -4 0 -2 0 25 -57 
	-57 14 -5 0 -1 -1 22 -37 
	-37 -7 1 -2 -1 -2 -4 -60 
	-60 54 -45 10 -4 -2 7 -53 
	-53 8 27 -33 7 -3 8 -45 
	-45 10 -4 22 -37 8 -4 -54 			
	-54 13 -4 0 25 -32 5 -58 
	-58 13 -4 0 0 28 -25 9
	a[j][i] =   (a[j][i] -  (a[j][i-1]>>1) + (a[j][i+1]>>1)); 
	237 117 176 148 166 160 112 144 
	144 165 154 161 160 162 118 68 
	68 140 165 153 161 161 175 197 
	197 109 56 204 131 174 144 162 
	162 171 126 77 203 145 161 113 
	113 143 129 93 85 213 151 192 
	192 165 179 173 122 92 211 154 
	154 192 176 185 181 124 71 99 
	*/
	//cols
	printf("lo-rows\n");
	//0 0 1 2 3 4 5 6 7 7
	for(j=0;j<8;j++) {//1
		for(i=0;i<8;i++) {//2
			if (i==0) {//3
				a[j][i] =   a[j][i] -  (a[j][i] + a[j][i+1] + 2 )>>2;
				 
			}//2
			a[j][i] =   a[j][i] -  (a[j][i-1] + a[j][i+1] + 2 )>>2;
			 
			if (i==7) {//3
				a[j][i] =   a[j][i] -  (a[j][i+1] + a[j][i+1] + 2 )>>2;
				 
			}//2

 
		}//1
	} //0



	for(j=0;j<8;j++){//1
		for(i=0;i<8;i++){//2
			//printf("0x%x ",a[j][i]);
			printf("%d ",a[j][i]);
		}//1
		printf("\n");
	}//0

 	//rows
	/*
	0
	0xxxxxxxx
	1
	2
	3
	4
	5
	6
	7xxxxxxx
	7r
  */
	printf("lo-cols\n");
	for(i=0;i<8;i++) {//1
		for(j=0;j<8;j++) {//2
			if (j==0) {//3
				a[j][i] =   a[j][i] -  (a[j][i] + a[j-1][i] + 2 )>>2;
				 
			}//2
			a[j][i] =   a[j][i] -  (a[j-1][i] + a[j][i] + 2 )>>2;
			 
			if (j==7) {//3
				a[j][i] =   a[j][i] -  (a[j][i] + a[j][i] + 2 )>>2;
				 
			}//2

 
		}//1
	} //0



	for(i=0;i<8;i++){//1
		for(j=0;j<8;j++){//2
			//printf("0x%x ",a[j][i]);
			printf("%d ",a[j][i]);
		}//1
		printf("\n");
	}//0
	return 1;
}
