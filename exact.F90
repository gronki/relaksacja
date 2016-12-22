program exact

    use common

    call init_x()

    y = y0 * exp(-k * x**(g+1) / (g+1))

    call write_results("exact.dat")

end program
