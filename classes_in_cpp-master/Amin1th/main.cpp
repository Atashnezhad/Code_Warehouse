#include <iostream>

using namespace std;



class Amin{
    public:
    int par1 = 4;
    double par2 = 5;
    // constructor
    Amin(int apar1, double apar2){
        par1 = apar1;
        par2 = apar2;

    }
    // method
    double aminFunc(){
        cout << "this is the first running class program" << endl;
        cout << "summation is = " << par1 + par2 << endl;
        return par1 + par2 ;

    }

};


int main()
{
    Amin amin1(2,5);


    cout << amin1.par1;
    cout << "\nand" << endl;
    cout << amin1.par2;
    cout << "\nand" << endl;
    double Bparameter = amin1.aminFunc();
    cout << "aminfunction results is = " << Bparameter << endl;


    return 0;
}


