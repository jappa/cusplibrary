#include <unittest/unittest.h>

#include <cusp/io/matrix_market.h>

#include <cusp/coo_matrix.h>
#include <cusp/csr_matrix.h>
#include <cusp/array2d.h>

#include <stdio.h>

void TestReadMatrixMarketFileCoordinateRealGeneral(void)
{
    // load matrix
    cusp::coo_matrix<int, float, cusp::host_memory> coo;
    cusp::io::read_matrix_market_file(coo, "data/test/coordinate_real_general.mtx");

    // convert to array2d
    cusp::array2d<float, cusp::host_memory> D(coo);

    // expected result
    cusp::array2d<float, cusp::host_memory> E(5, 5);
    E(0,0) =  1.000e+00; E(0,1) =  0.000e+00; E(0,2) =  0.000e+00; E(0,3) =  6.000e+00; E(0,4) =  0.000e+00;
    E(1,0) =  0.000e+00; E(1,1) =  1.050e+01; E(1,2) =  0.000e+00; E(1,3) =  0.000e+00; E(1,4) =  0.000e+00;
    E(2,0) =  0.000e+00; E(2,1) =  0.000e+00; E(2,2) =  2.500e-01; E(2,3) =  0.000e+00; E(2,4) =  0.000e+00;
    E(3,0) =  0.000e+00; E(3,1) =  2.505e+02; E(3,2) =  0.000e+00; E(3,3) = -2.500e+02; E(3,4) =  3.875e+01;
    E(4,0) =  0.000e+00; E(4,1) =  0.000e+00; E(4,2) =  0.000e+00; E(4,3) =  0.000e+00; E(4,4) =  1.200e+01;

    ASSERT_EQUAL(D == E, true);
}
DECLARE_UNITTEST(TestReadMatrixMarketFileCoordinateRealGeneral);

void TestReadMatrixMarketFileCoordinatePatternSymmetric(void)
{
    // load matrix
    cusp::coo_matrix<int, float, cusp::host_memory> coo;
    cusp::io::read_matrix_market_file(coo, "data/test/coordinate_pattern_symmetric.mtx");

    // convert to array2d
    cusp::array2d<float, cusp::host_memory> D(coo);

    // expected result
    cusp::array2d<float, cusp::host_memory> E(5, 5);
    E(0,0) =  1.000e+00; E(0,1) =  0.000e+00; E(0,2) =  0.000e+00; E(0,3) =  0.000e+00; E(0,4) =  0.000e+00;
    E(1,0) =  0.000e+00; E(1,1) =  1.000e+00; E(1,2) =  0.000e+00; E(1,3) =  1.000e+00; E(1,4) =  0.000e+00;
    E(2,0) =  0.000e+00; E(2,1) =  0.000e+00; E(2,2) =  1.000e+00; E(2,3) =  0.000e+00; E(2,4) =  0.000e+00;
    E(3,0) =  0.000e+00; E(3,1) =  1.000e+00; E(3,2) =  0.000e+00; E(3,3) =  1.000e+00; E(3,4) =  1.000e+00;
    E(4,0) =  0.000e+00; E(4,1) =  0.000e+00; E(4,2) =  0.000e+00; E(4,3) =  1.000e+00; E(4,4) =  1.000e+00;

    ASSERT_EQUAL(D == E, true);
}
DECLARE_UNITTEST(TestReadMatrixMarketFileCoordinatePatternSymmetric);

void TestReadMatrixMarketFileArrayRealGeneral(void)
{
    // load matrix
    cusp::coo_matrix<int, float, cusp::host_memory> coo;
    cusp::io::read_matrix_market_file(coo, "data/test/array_real_general.mtx");

    // convert to array2d
    cusp::array2d<float, cusp::host_memory> D(coo);

    // expected result
    cusp::array2d<float, cusp::host_memory> E(4, 3);
    E(0,0) =  1.0; E(0,1) =  5.0; E(0,2) =  9.0;
    E(1,0) =  2.0; E(1,1) =  6.0; E(1,2) = 10.0;
    E(2,0) =  3.0; E(2,1) =  7.0; E(2,2) = 11.0;
    E(3,0) =  4.0; E(3,1) =  8.0; E(3,2) = 12.0;

    ASSERT_EQUAL(D == E, true);
}
DECLARE_UNITTEST(TestReadMatrixMarketFileArrayRealGeneral);

template <typename MemorySpace>
void TestReadMatrixMarketFileToCsrMatrix(void)
{
    // load matrix
    cusp::coo_matrix<int, float, MemorySpace> csr;
    cusp::io::read_matrix_market_file(csr, "data/test/coordinate_real_general.mtx");

    // convert to array2d
    cusp::array2d<float, cusp::host_memory> D(csr);

    // expected result
    cusp::array2d<float, cusp::host_memory> E(5, 5);
    E(0,0) =  1.000e+00; E(0,1) =  0.000e+00; E(0,2) =  0.000e+00; E(0,3) =  6.000e+00; E(0,4) =  0.000e+00;
    E(1,0) =  0.000e+00; E(1,1) =  1.050e+01; E(1,2) =  0.000e+00; E(1,3) =  0.000e+00; E(1,4) =  0.000e+00;
    E(2,0) =  0.000e+00; E(2,1) =  0.000e+00; E(2,2) =  2.500e-01; E(2,3) =  0.000e+00; E(2,4) =  0.000e+00;
    E(3,0) =  0.000e+00; E(3,1) =  2.505e+02; E(3,2) =  0.000e+00; E(3,3) = -2.500e+02; E(3,4) =  3.875e+01;
    E(4,0) =  0.000e+00; E(4,1) =  0.000e+00; E(4,2) =  0.000e+00; E(4,3) =  0.000e+00; E(4,4) =  1.200e+01;

    ASSERT_EQUAL(D == E, true);
}
DECLARE_HOST_DEVICE_UNITTEST(TestReadMatrixMarketFileToCsrMatrix);

template <typename MemorySpace>
void TestWriteMatrixMarketFileCoordinateRealGeneral(void)
{
    // initial matrix
    cusp::array2d<float, cusp::host_memory> E(4, 3);
    E(0,0) =  1.000e+00; E(0,1) =  0.000e+00; E(0,2) =  0.000e+00;
    E(1,0) =  0.000e+00; E(1,1) =  1.050e+01; E(1,2) =  0.000e+00;
    E(2,0) =  0.000e+00; E(2,1) =  0.000e+00; E(2,2) =  2.500e-01;
    E(3,0) =  0.000e+00; E(3,1) =  2.505e+02; E(3,2) =  0.000e+00;

    // convert to coo
    cusp::coo_matrix<int, float, MemorySpace> coo(E);
   
    // write coo to file
    cusp::io::write_matrix_market_file(coo, "temp_92038423749283.mtx");
    
    // read file back
    cusp::io::read_matrix_market_file(coo, "temp_92038423749283.mtx");

    remove("temp_92038423749283.mtx");    
    
    // compare to initial matrix
    cusp::array2d<float, cusp::host_memory> D(coo);
    ASSERT_EQUAL(D == E, true);
}
DECLARE_HOST_DEVICE_UNITTEST(TestWriteMatrixMarketFileCoordinateRealGeneral);

////    E(0,0) =  0.000e+00; E(0,1) =  0.000e+00; E(0,2) =  0.000e+00; E(0,3) =  0.000e+00; E(0,4) =  0.000e+00;
////    E(1,0) =  0.000e+00; E(1,1) =  0.000e+00; E(1,2) =  0.000e+00; E(1,3) =  0.000e+00; E(1,4) =  0.000e+00;
////    E(2,0) =  0.000e+00; E(2,1) =  0.000e+00; E(2,2) =  0.000e+00; E(2,3) =  0.000e+00; E(2,4) =  0.000e+00;
////    E(3,0) =  0.000e+00; E(3,1) =  0.000e+00; E(3,2) =  0.000e+00; E(3,3) =  0.000e+00; E(3,4) =  0.000e+00;
////    E(4,0) =  0.000e+00; E(4,1) =  0.000e+00; E(4,2) =  0.000e+00; E(4,3) =  0.000e+00; E(4,4) =  0.000e+00;