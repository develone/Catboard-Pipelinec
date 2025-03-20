/*
*  dwt97.c - Fast discrete biorthogonal CDF 9/7 wavelet forward and inverse transform (lifting implementation)
*	
*  This code is provided "as is" and is given for educational purposes.
*  2006 - Gregoire Pau - gregoire.pau@ebi.ac.uk - http://www.ebi.ac.uk/~gpau/misc/dwt97.c
*
*/

#include <stdio.h>
#include <stdlib.h>
FILE *file;
long file_size;
char *buffer;
 
short b[31];
const char *filename = "a64.bin";
double *tempbank=0;

/*
*  fwt97 - Forward biorthogonal 9/7 wavelet transform (lifting implementation)
*
*  x is an input signal, which will be replaced by its output transform.
*  n is the length of the signal, and must be a power of 2.
*
*  The first half part of the output signal contains the approximation coefficients.
*  The second half part contains the detail coefficients (aka. the wavelets coefficients).
*
*  See also iwt97.
*/
void fwt97(double* x,int n) {
	double a;
	int i;

	// Predict 1
	a=-1.586134342;
	for (i=1;i<n-2;i+=2) x[i]+=a*(x[i-1]+x[i+1]);
	x[n-1]+=2*a*x[n-2];

	// Update 1
	a=-0.05298011854;
	for (i=2;i<n;i+=2) x[i]+=a*(x[i-1]+x[i+1]);
	x[0]+=2*a*x[1];

	// Predict 2
	a=0.8829110762;
	for (i=1;i<n-2;i+=2) x[i]+=a*(x[i-1]+x[i+1]);
	x[n-1]+=2*a*x[n-2];

	// Update 2
	a=0.4435068522;
	for (i=2;i<n;i+=2) x[i]+=a*(x[i-1]+x[i+1]);
	x[0]+=2*a*x[1];

	// Scale
	a=1/1.149604398;
	for (i=0;i<n;i++) if (i%2) x[i]*=a; else x[i]/=a;

	// Pack
	if (tempbank==0) tempbank=(double *)malloc(n*sizeof(double));
	for (i=0;i<n;i++) if (i%2==0) tempbank[i/2]=x[i]; else tempbank[n/2+i/2]=x[i];
	for (i=0;i<n;i++) x[i]=tempbank[i];
}

/*
*  iwt97 - Inverse biorthogonal 9/7 wavelet transform
*
*  This is the inverse of fwt97 so that iwt97(fwt97(x,n),n)=x for every signal x of length n.
*
*  See also fwt97.
*/
void iwt97(double* x,int n) {
	double a;
	int i;

	// Unpack
	if (tempbank==0) tempbank=(double *)malloc(n*sizeof(double));
	for (i=0;i<n/2;i++) {
		tempbank[i*2]=x[i];
		tempbank[i*2+1]=x[i+n/2];
	}
	for (i=0;i<n;i++) x[i]=tempbank[i];

	// Undo scale
	a=1.149604398;
	for (i=0;i<n;i++) if (i%2) x[i]*=a; else x[i]/=a;

	// Undo update 2
	a=-0.4435068522;
	for (i=2;i<n;i+=2) x[i]+=a*(x[i-1]+x[i+1]);
	x[0]+=2*a*x[1];

	// Undo predict 2
	a=-0.8829110762;
	for (i=1;i<n-2;i+=2) x[i]+=a*(x[i-1]+x[i+1]);
	x[n-1]+=2*a*x[n-2];

	// Undo update 1
	a=0.05298011854;
	for (i=2;i<n;i+=2) x[i]+=a*(x[i-1]+x[i+1]);
	x[0]+=2*a*x[1];

	// Undo predict 1
	a=1.586134342;
	for (i=1;i<n-2;i+=2) x[i]+=a*(x[i-1]+x[i+1]);
	x[n-1]+=2*a*x[n-2];
}

int main() {
	double x[32];
	int i;

	// Makes a fancy cubic signal
	//for (i=0;i<32;i++) x[i]=5+i+0.4*i*i-0.02*i*i*i;
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
	//printf("file_size = %d\n",file_size);
	 
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
	for(i=0;i<32;i++) {
		b[i]=*buffer;
		
		x[i]=(double)b[i];
		//printf("%d 5.3%f ",b[i],x[i]);
		buffer+=1;
	}
	
	// Prints original sigal x
	printf("Original signal:\n");
	for (i=0;i<32;i++) printf("x[%d]=%f\n",i,x[i]);
	printf("\n");

	// Do the forward 9/7 transform
	fwt97(x,32);

	// Prints the wavelet coefficients
	printf("Wavelets coefficients:\n");
	for (i=0;i<32;i++) printf("wc[%d]=%f\n",i,x[i]);
	printf("\n");

	// Do the inverse 9/7 transform
	iwt97(x,32); 

	// Prints the reconstructed signal 
	printf("Reconstructed signal:\n");
	for (i=0;i<32;i++) printf("xx[%d]=%f\n",i,x[i]);
} 