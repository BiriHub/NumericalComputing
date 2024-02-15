function [x_coords,y_coords] = temperatureData(starting_year,ending_year,month_period)
    % Function returns the temperature data between the month "month_period" in the year "starting_year" and the month
    % "month_period" in the year "ending_year"

    % month is a number value that rappresent the desired month 
    % (January = 2 ... December = 13 )

    if(nargin<3)
    starting_year=1864;
    ending_year=2021;
    month_period=2;
    end

    if(month_period<2)
        month_period=2;
    elseif(month_period>13)
        month_period=13;
    end
    

    data=[
1864	-7.1	-4.52	0.04	2.11	7.43	9.48	12.37	10.95	8.59	3.5	-0.51	-4.47	NaN	3.19	10.93	3.86	NaN	8.49	3.16
1865	-3.47	-6.25	-5.91	7.03	10.09	10.98	13.99	11.16	11.9	5.19	1.26	-3.07	-4.73	3.74	12.04	6.12	-2.85	10.86	4.41
1866	-1.31	-0.42	-1	4.11	4.95	12.02	12.25	9.98	9.7	5.34	-0.2	-0.49	-1.6	2.69	11.42	4.95	0.11	8.84	4.58
1867	-3.87	0.56	-0.13	3.49	7.74	10.57	11.29	12.93	10.43	2.92	-1.43	-5.8	-1.27	3.7	11.6	3.97	0.2	9.41	4.06
1868	-5.46	-1.53	-2.3	2.33	12.04	11.97	12.89	12.5	11.12	4.76	-1.98	1.27	-4.26	4.02	12.45	4.63	-2.27	10.47	4.8
1869	-4.62	1.28	-4.25	4.53	8.92	8.26	14.82	10.86	10.35	2.3	0.09	-4.18	-0.69	3.07	11.31	4.25	-0.59	9.62	4.03
1870	-5.47	-4.23	-2.59	2.81	8.89	11.41	14.4	9.84	8.16	4.06	-0.14	-6.81	-4.62	3.04	11.88	4.03	-2.35	9.25	3.36
1871	-7.82	-1.96	0.02	3.53	6.66	7.27	13.14	12.6	11.33	3.31	-2.85	-8.3	-5.53	3.41	11	3.93	-2.11	9.09	3.08
1872	-3.22	-2.09	0.47	3.95	6.07	10.08	13.45	10.87	10.18	5.33	1.78	-0.77	-4.54	3.5	11.47	5.76	-2.11	9.1	4.67
1873	-2.19	-3.85	1.66	1.62	5.1	10.54	14.52	13.55	8.67	5.45	0.65	-2.88	-2.27	2.8	12.87	4.93	0.33	9	4.41
1874	-3.14	-4.07	-1.29	4.59	3.96	11.29	15.01	10.91	10.99	5.71	-2.12	-6.34	-3.36	2.42	12.4	4.86	-0.88	9.46	3.79
1875	-1.77	-6.47	-2.14	2.9	9.49	11.38	11.44	13.57	10.64	3.8	-1.14	-5.52	-4.86	3.42	12.13	4.43	-2.19	9.9	3.85
1876	-4.41	-2.37	-0.88	2.92	4.41	10.52	13.58	13.1	7.9	7.25	-1.2	-0.09	-4.1	2.15	12.4	4.65	-1.75	8.74	4.23
1877	-1.64	-1.79	-2.32	2.56	4.95	13.39	11.83	13.51	7.28	2.7	1.72	-3.45	-1.17	1.73	12.91	3.9	0.04	8.92	4.06
1878	-5.82	-1.76	-2.24	3.13	8.27	10.2	11.91	12.16	9.43	5.45	-2	-6.36	-3.68	3.05	11.42	4.3	-1.48	9.18	3.53
1879	-4.1	-2.59	0.08	0.93	3.42	10.83	9.79	14.02	9.31	3.99	-3.14	-8.4	-4.35	1.48	11.55	3.39	-1.59	8.05	2.85
1880	-6.41	-2.06	2.18	3.73	6.21	8.91	13.68	11.13	9.65	5.41	1.14	0.44	-5.62	4.04	11.24	5.4	-2.31	8.89	4.5
1881	-6.82	-1.95	1.12	2.7	6.42	9.91	15.24	12.71	7.46	1.16	2.86	-2.92	-2.78	3.41	12.62	3.83	-0.11	9.07	3.99
1882	-2.01	-2.38	1.67	2.8	7.56	9.55	10.95	10.29	7.41	5.1	0.09	-2.14	-2.44	4.01	10.26	4.2	-0.27	8.09	4.07
1883	-3.2	-1.1	-4.36	1.89	7.32	9.84	10.9	11.64	8.15	3.85	0.22	-3.65	-2.15	1.62	10.79	4.07	-0.94	8.29	3.46
1884	-1.74	-1.28	0.8	2.47	8.5	7.4	13.19	12.63	9.4	3.26	-1.66	-2.54	-2.22	3.92	11.07	3.67	-0.3	8.93	4.2
1885	-6.02	-0.03	-0.49	3.8	4.85	12.3	13.75	11.8	8.54	2.58	1.21	-3.11	-2.86	2.72	12.62	4.11	-1.25	9.17	4.1
1886	-5.24	-5.25	-1.85	4.35	7.55	8.78	13.09	12.12	11.24	6.04	0.56	-3.82	-4.53	3.35	11.33	5.95	-1.94	9.52	3.97
1887	-5.76	-4.93	-2.2	2.47	4.55	11.89	14.59	12.08	8.27	0.75	-0.77	-5.41	-4.83	1.6	12.85	2.75	-1.68	8.97	2.96
1888	-5.32	-5.26	-2.34	0.99	8.05	10.8	10.02	10.81	9.45	2.39	1.16	-1.85	-5.33	2.23	10.54	4.33	-3.06	8.35	3.24
1889	-4.78	-6.14	-3.6	1.32	8.49	11.67	11.69	11.08	7.48	3.86	0.66	-5.47	-4.26	2.07	11.48	4	-2.14	8.62	3.02
1890	-1.3	-5.66	-0.78	2.3	7.95	9.53	10.72	11.45	8.27	2.97	-0.96	-6.74	-4.14	3.16	10.57	3.42	-1.45	8.37	3.15
1891	-8.52	-4.02	-1.61	0.49	6.76	10.47	11.27	10.57	9.82	5.89	-0.24	-1.93	-6.43	1.88	10.77	5.16	-3.15	8.23	3.25
1892	-4.41	-2.62	-3.41	3.22	7.32	10.89	12.04	13.38	9.76	3.8	2.08	-4.81	-2.99	2.38	12.1	5.22	-1.12	9.44	3.94
1893	-8.48	-2.44	0.74	6.33	6.99	10.81	12.32	13.31	9.25	6.37	-0.69	-3.32	-5.24	4.69	12.15	4.98	-1.52	9.84	4.27
1894	-5.06	-2.61	-0.11	4.96	6.39	9.93	13.03	11.73	7.84	4.48	1.66	-3.99	-3.66	3.75	11.56	4.66	-0.9	8.98	4.02
1895	-8.66	-9.26	-2.18	4.17	6.87	10.52	13.24	11.98	12.61	4	3.39	-2.53	-7.31	2.95	11.92	6.66	-2.99	9.9	3.68
1896	-4.49	-2.83	1.34	0.57	5.51	10.47	12.78	9.25	8.27	3.46	-1.62	-3.01	-3.28	2.47	10.83	3.37	-0.19	7.81	3.31
1897	-4.76	0.07	1.44	2.95	5.48	12.35	13.05	12.25	7.98	3.99	1.38	-2.69	-2.57	3.29	12.55	4.45	-0.74	9.01	4.46
1898	-0.76	-3.54	-1.05	3.41	6.12	9.44	11.24	13.91	11.38	6.47	2.49	-2.27	-2.33	2.83	11.53	6.78	-0.45	9.25	4.74
1899	-1.6	-0.56	-0.14	2.39	6.21	10.47	12.49	13.6	8.66	6.37	2.06	-4.63	-1.48	2.82	12.19	5.7	0.73	8.97	4.61
1900	-3.03	-0.99	-4.08	1.97	6.33	11.52	13.97	11.3	11.29	5.52	0.87	-0.61	-2.88	1.41	12.27	5.89	-0.72	9.4	4.5
1901	-4.7	-8.75	-2.62	3.41	7.5	11.32	12.92	11.85	9.58	4.55	-1.4	-2.81	-4.69	2.76	12.03	4.24	-1.72	9.43	3.4
1902	-2.53	-3.1	-0.38	5.13	3.09	9.47	13.1	11.5	9.12	4.03	-0.06	-3.35	-2.81	2.61	11.36	4.36	-0.94	8.57	3.84
1903	-3.55	-0.81	0.52	-0.51	7.11	9.44	11.35	12.2	9.4	5.51	0.1	-3.92	-2.57	2.37	11	5	-0.53	8.17	3.9
1904	-4.25	-3.13	-0.59	4.65	8.56	11.73	15.13	13.21	7.38	4.95	-0.62	-2.02	-3.77	4.21	13.35	3.9	-1.05	10.11	4.58
1905	-6.29	-4.01	0.11	2.91	5.97	11.17	15.07	12.15	9.44	-0.3	-0.89	-2.44	-4.1	2.99	12.8	2.75	-1.31	9.45	3.57
1906	-3.61	-5.08	-1.59	2.25	7.36	10.06	12.94	13.42	8.71	7.05	1.68	-6.43	-3.71	2.67	12.14	5.81	-2.32	9.12	3.9
1907	-4.66	-5.94	-2.06	1.24	7.76	10.46	10.69	13	10.3	6.09	1.56	-1.46	-5.68	2.31	11.38	5.98	-1.73	8.91	3.91
1908	-4.25	-3.65	-2.45	0.66	9.06	12.35	12.13	10.84	8.55	5.86	-0.37	-3.44	-3.12	2.42	11.77	4.68	-0.69	8.93	3.77
1909	-5.39	-6.45	-3.05	4.5	6.75	8.67	10.38	11.81	8.2	6.06	-1.58	-1.46	-5.09	2.73	10.29	4.23	-2.14	8.39	3.2
1910	-3.25	-2.93	-0.59	2.07	5.62	10.73	10.39	11.43	7.06	5.87	-1.43	-0.86	-2.54	2.37	10.85	3.84	-0.62	7.88	3.68
1911	-5.5	-3.07	-0.64	2.01	7.35	10.14	15.26	15.27	11.23	5.08	1.82	-0.86	-3.14	2.9	13.56	6.04	-0.94	10.21	4.84
1912	-2.27	0.1	1.47	1.81	8.05	10.5	11.98	9.07	4.38	3.7	-2.52	-1.11	-1.01	3.78	10.52	1.85	0.89	7.63	3.76
1913	-2.12	-3.16	1.73	2.49	6.95	10.13	9.55	11.2	8.53	6.57	2.69	-2.83	-2.13	3.72	10.29	5.93	-0.58	8.14	4.31
1914	-6.53	-0.48	-0.01	5.17	5.72	9.16	10.9	12.26	8.54	4.34	-0.66	-1.13	-3.28	3.62	10.77	4.08	-0.1	8.63	3.94
1915	-4.72	-3.81	-1.52	1.75	9.56	12.38	11.83	10.92	7.7	2.48	-2.16	0.77	-3.22	3.26	11.71	2.67	-1.25	9.02	3.76
1916	-0.96	-2.63	-0.05	3.09	8.05	8.33	11.57	11.69	7.25	4.75	0.37	-1.93	-0.94	3.69	10.53	4.12	-0.43	8.33	4.13
1917	-6.13	-5.2	-2.82	-0.45	9.97	12.63	12.5	11.43	11.5	2.52	-0.14	-6.28	-4.42	2.23	12.19	4.63	-1.83	9.6	3.3
1918	-2.8	-2.29	-0.57	3.08	8.66	8.38	12.43	11.94	9.81	3.37	0.3	-0.36	-3.79	3.72	10.92	4.49	-1.6	9.05	4.33
1919	-4.09	-4.03	-0.88	0.36	6.77	10.88	9.43	13.93	11.09	1.24	-2.15	-2.29	-2.83	2.08	11.41	3.4	-0.95	8.74	3.36
1920	-1.04	-0.67	1.92	3.62	10.11	10.36	12.56	10.57	9.39	5.49	0.82	-2.37	-1.33	5.22	11.16	5.24	-0.5	9.44	5.06
1921	-0.48	-3.03	1.08	2.04	8.74	11.01	15.08	12.58	11.28	8.1	-1.45	-2.15	-1.96	3.95	12.89	5.97	0.25	10.12	5.23
1922	-4.77	-2.71	0.51	1.19	9.49	11.2	11.3	12.25	6.99	3.37	-1.55	-2.98	-3.21	3.73	11.58	2.94	-0.41	8.74	3.69
1923	-4.48	-1.22	0.1	3.13	7.36	7.29	15.09	13.64	8.89	6.88	0.06	-3.85	-2.89	3.53	12.01	5.28	-1.13	9.23	4.41
1924	-4.44	-5.61	-0.51	3.26	8.74	10.67	12.71	9.33	9.49	5.37	1.56	-1.76	-4.63	3.83	10.9	5.47	-1.25	9.03	4.07
1925	-1.25	-1.68	-3.32	2.99	7.64	11.57	12.09	11.81	6.86	5.86	-0.86	-3.32	-1.56	2.44	11.82	3.95	-0.18	8.83	4.03
1926	-3.66	1.27	0.4	4.39	5.67	8.19	11.84	12.75	11.61	5.59	2.64	-3.83	-1.9	3.49	10.93	6.62	-0.05	9.07	4.74
1927	-3.34	-3.12	0.11	3.52	8.4	10.73	12.72	11.78	9.38	5.38	1.36	-2.79	-3.43	4.01	11.74	5.37	-0.32	9.42	4.51
1928	-2.3	-1.47	0.37	3.28	5.28	11.07	16.14	14.13	9.51	4.89	1.35	-4	-2.19	2.98	13.78	5.25	0.09	9.9	4.86
1929	-7.4	-8.42	0.21	0.96	7.95	11.66	13.96	12.67	12.39	5.6	0.8	-1.01	-6.61	3.04	12.77	6.26	-2.23	9.93	4.11
1930	-0.83	-3.93	0.81	3.71	6.21	13.54	11.67	12.38	10.06	4.95	2.63	-2.27	-1.93	3.58	12.53	5.88	0.24	9.59	4.91
1931	-4.45	-5.27	-1.89	2.09	9.43	13.45	12.23	10.75	5.29	4.6	2.19	-3.98	-4	3.21	12.14	4.03	-1.05	8.87	3.7
1932	-1.77	-6.86	-2.08	1.25	6.48	9.72	12.05	15.12	12.38	4.54	1.5	-1.04	-4.2	1.88	12.29	6.14	-1.32	9.5	4.27
1933	-5.76	-3.41	0.61	3.97	5.99	8.27	13.84	13.93	10.21	5.27	-0.96	-5.99	-3.4	3.52	12.01	4.84	-0.59	9.37	3.83
1934	-3.7	-2.75	-0.4	5.57	9.55	11.04	14.12	11.47	11.03	4.99	0.07	0.58	-4.15	4.91	12.21	5.36	-1.42	10.46	5.13
1935	-6.22	-2.63	-1.64	2.07	5.69	12.91	14.01	11.78	10.26	4.76	1.32	-4.03	-2.76	2.04	12.9	5.45	-0.81	9.45	4.02
1936	-0.32	-2.87	1.21	2.61	7.92	10.31	11.8	12.36	9.4	1.53	0.56	-1.77	-2.4	3.91	11.49	3.83	0.01	9.06	4.39
1937	-1.83	-0.98	-1.54	2.6	9	11.76	13.44	12.63	8.75	5.67	0.04	-4.71	-1.53	3.35	12.61	4.82	-0.67	9.7	4.57
1938	-3.31	-3.42	2.49	0.32	5.81	12.36	12.29	12.14	9.76	5.45	3.16	-4.14	-3.82	2.88	12.26	6.12	-0.54	8.78	4.41
1939	-2.11	-1.54	-3.45	4.51	4.61	11.13	11.88	12.56	8.79	3.66	2.34	-3.95	-2.6	1.89	11.86	4.93	-0.44	8.91	4.04
1940	-6.9	-2.71	-0.3	3.16	7.17	10.23	11.41	11.22	9.63	4.77	0.94	-7.17	-4.52	3.35	10.95	5.11	-1.31	8.8	3.45
1941	-5.58	-3.08	0.22	1.71	4.09	11.37	13.93	11.08	9.03	3.66	-0.34	-3.46	-5.28	2.01	12.13	4.12	-1.65	8.54	3.55
1942	-8.26	-6.67	1.63	3.77	7.69	11.5	12.7	12.91	11.48	7.67	-0.98	-1.78	-6.13	4.36	12.37	6.06	-2.24	10.01	4.31
1943	-3.22	-1.67	1.89	4.66	8.92	10.08	13.2	14.43	10.67	7.35	-0.94	-2.21	-2.23	5.15	12.57	5.69	0.32	10.33	5.26
1944	-1.91	-6.01	-3.45	4.83	7.68	9.91	12.7	15.86	9.02	3.66	-0.49	-4.43	-3.38	3.02	12.83	4.06	-1.19	10	3.95
1945	-8.82	0.01	1.32	5.09	9.59	13.09	14.56	12.03	10.22	5.17	-0.6	-2.76	-4.42	5.33	13.23	4.93	-1.46	10.76	4.91
1946	-4.77	-1.31	1.2	6.22	8.54	10.03	13.86	12.33	10.73	4.43	0.4	-4.75	-2.95	5.32	12.07	5.19	-0.51	10.29	4.74
1947	-6.45	-4.6	0.99	6.26	9.96	13.25	15.17	15.18	11.99	6.31	2.41	-3.07	-5.27	5.74	14.54	6.9	-1.66	11.97	5.62
1948	-0.78	-2.56	3.58	4.27	9	10.12	10.47	12.47	9.81	6.3	2.48	-1.82	-2.14	5.62	11.02	6.2	0.98	9.36	5.28
1949	-2.42	-1.91	-1.89	6.61	6.64	11	14.5	13.51	12.69	7.55	-0.3	-0.85	-2.05	3.78	13	6.65	0.12	10.83	5.43
1950	-3.49	-0.79	1.11	1.83	9.18	13.68	15.49	13.29	9.24	5.31	0.55	-5.08	-1.71	4.04	14.15	5.03	0.54	10.45	5.03
1951	-2.46	-2.52	-1.34	2.92	6.9	10.74	13.32	12.51	10.89	4.95	2.07	-1.36	-3.35	2.83	12.19	5.97	-0.92	9.55	4.72
1952	-4.8	-4.93	0.94	5.38	8.37	12.6	15.95	13.7	6.5	4.2	-1.48	-3.33	-3.7	4.9	14.08	3.07	-0.52	10.42	4.42
1953	-5.94	-4.36	0.72	4.56	8.99	9.74	13.29	12.87	10.73	6.79	1.73	-0.32	-4.54	4.75	11.97	6.42	-1.7	10.03	4.9
1954	-6.07	-4.22	1.02	1.79	6.68	11.21	10.59	11.08	9.93	5.65	1.54	-0.83	-3.54	3.16	10.96	5.71	-0.18	8.55	4.03
1955	-1.94	-3.75	-1.95	3.26	6.56	10.76	12.65	11.67	8.99	3.99	-0.05	0.08	-2.17	2.62	11.69	4.31	-0.21	8.98	4.19
1956	-2.1	-11.93	-0.65	1.5	7.89	8.5	12.46	10.95	10.88	3.72	-1.42	-2.64	-4.65	2.91	10.64	4.39	-1.78	8.7	3.1
1957	-3.92	-0.15	3.77	3.58	4.91	11.51	12.76	11.42	8.79	5.83	1.6	-2.58	-2.24	4.09	11.9	5.41	-0.11	8.83	4.79
1958	-3.71	-0.48	-3.32	0.73	9.83	10.23	13.22	13.42	11.58	4.75	0.91	-1.27	-2.26	2.41	12.29	5.75	-0.44	9.84	4.66
1959	-3.7	-0.97	2.61	4.34	8.15	11.22	14.69	12.28	11.17	5.17	-0.25	-1.38	-1.98	5.03	12.73	5.37	0.39	10.31	5.28
1960	-3.9	-1.59	1.2	3.2	8.85	11.94	10.81	11.73	7.94	4.2	1.63	-3.03	-2.29	4.42	11.49	4.59	-0.12	9.08	4.41
1961	-3.14	0.78	1.77	6.11	6.21	11.66	11.61	12.29	13.32	6.43	0.69	-1.39	-1.8	4.7	11.86	6.81	0.37	10.2	5.53
1962	-2.4	-3.74	-3.49	2.81	5.61	10.05	12.14	14.25	9.65	6.12	-1.2	-5.39	-2.51	1.64	12.15	4.86	-0.65	9.08	3.7
1963	-8.59	-7.22	-0.94	4.14	6.74	10.66	13.88	11.32	9.98	5.74	3.04	-4.27	-7.07	3.32	11.95	6.25	-2.87	9.45	3.71
1964	-3.82	-1.46	-0.8	4.48	9.23	12.34	14.58	12.05	10.37	3.41	2.01	-3.25	-3.18	4.3	12.99	5.26	-0.26	10.51	4.93
1965	-2.98	-6.96	-0.63	1.7	6.69	11.41	11.38	11.3	7.65	6.34	-0.16	-1.54	-4.4	2.59	11.36	4.61	-1.4	8.35	3.68
1966	-5.19	1.48	-1.48	4.69	7.92	11.86	11.08	11.08	11.21	7.55	-1.93	-2.62	-1.75	3.71	11.34	5.61	-0.09	9.64	4.64
1967	-3.69	-1.75	0.8	2.11	7.1	9.87	14.69	12.55	9.18	7.92	1.94	-4.25	-2.69	3.34	12.37	6.35	-0.28	9.25	4.71
1968	-4.54	-2.04	0.03	4.51	6.67	10.73	12.35	10.72	8.62	7.65	1.24	-3.86	-3.61	3.74	11.27	5.84	-0.16	8.93	4.34
1969	-2.48	-5.65	-0.38	2.63	8.65	8.88	13.77	11.52	10.56	7.32	0.67	-6.59	-4	3.64	11.39	6.18	-0.58	9.34	4.08
1970	-2.86	-3.87	-3.11	0.67	6.08	12	12.54	12.65	10.84	5.18	2.39	-3.64	-4.44	1.22	12.39	6.14	-1.41	9.13	4.07
1971	-3.98	-3.29	-4.04	5.51	8.9	9.21	14.32	14.01	9.04	6.84	-0.49	-0.59	-3.63	3.46	12.51	5.13	-1.23	10.17	4.62
1972	-3.28	-0.51	1.86	2.5	6.46	9.59	12.28	11.71	6.58	4.42	1.1	-1.85	-1.46	3.61	11.19	4.03	0.64	8.19	4.24
1973	-2.99	-4.39	-1.33	0.05	8.48	11.53	12.2	14.36	10.75	4.51	0.7	-2.81	-3.08	2.4	12.69	5.32	-0.84	9.56	4.25
1974	-0.29	-1.2	1.78	3.18	6.55	9.32	12.23	13.63	8.97	-0.27	0.31	-0.36	-1.43	3.84	11.73	3	0.45	8.98	4.49
1975	-0.09	-1.61	-1.28	2.71	7.41	9.41	13.11	12.99	11.56	4.57	0.44	-2.24	-0.69	2.95	11.84	5.52	-0.55	9.53	4.75
1976	-2.7	-1.26	-0.76	3.05	8.53	13.14	13.8	11.12	7.99	6.62	0.2	-4.26	-2.07	3.61	12.69	4.94	-0.33	9.61	4.62
1977	-2.9	-0.3	2.72	1.83	6.79	10.2	12.33	11.04	8.55	7.21	0.41	-1.05	-2.49	3.78	11.19	5.39	0.35	8.46	4.74
1978	-3.22	-3.26	0.43	1.99	6.02	9.66	11.83	11.32	9.42	5.56	1.11	-1.03	-2.51	2.81	10.93	5.37	0.09	8.37	4.15
1979	-5.74	-1.81	0.37	1.19	7.16	11.51	12.64	11.31	9.92	6.94	0.14	-0.45	-2.86	2.9	11.82	5.67	-0.26	8.95	4.43
1980	-4.51	-0.76	0	0.69	5.86	9.05	10.67	13.41	10.94	4.65	0.05	-3.9	-1.91	2.18	11.04	5.21	0.23	8.44	3.84
1981	-5.06	-4.44	2.61	5.02	7.27	11.17	11.74	13.33	10.15	5.12	0.48	-3.61	-4.47	4.97	12.08	5.25	-1.02	9.78	4.48
1982	-1.82	-2.39	-1	2.46	8.01	11.92	14.84	12.39	11.87	5.34	2.3	-1.25	-2.6	3.16	13.05	6.5	-0.54	10.25	5.22
1983	-0.63	-5.04	1.04	3.7	5.7	11.83	17.35	13.34	10.75	6.31	1.38	-1.64	-2.31	3.48	14.17	6.15	0.29	10.44	5.34
1984	-3.32	-4.75	-2.3	2.17	4.92	10.27	13.27	12.38	8.23	6.47	3.38	-1.32	-3.24	1.6	11.97	6.03	-0.72	8.54	4.12
1985	-8.05	-2.76	-1.6	3.29	7.46	9.45	14.7	12.9	11.83	7.09	-2.22	0.23	-4.04	3.05	12.35	5.56	-0.64	9.94	4.36
1986	-3.64	-7.49	-0.15	1.62	9.61	11.41	13.09	12.77	10.51	7.4	2.08	-1.86	-3.63	3.69	12.42	6.66	-1.03	9.84	4.61
1987	-6.03	-2.26	-3.22	4.46	5.11	9.5	13.56	13.1	12.95	7.29	1.46	0.32	-3.38	2.12	12.06	7.23	-0.65	9.78	4.69
1988	-0.32	-2.74	-1.43	4.57	9.06	10.58	13.66	13.78	10	7.68	0.22	-0.86	-0.91	4.07	12.67	5.97	0.77	10.28	5.35
1989	-0.66	0.1	3.31	2.54	9.21	10.43	14.07	13.34	9.99	7.06	0.61	0.17	-0.47	5.02	12.61	5.88	1.63	9.93	5.85
1990	-1.67	2.1	2.76	2.51	9.79	10.68	14.06	14.3	9.4	7.85	0.4	-3.79	0.2	5.02	13.01	5.88	1.84	10.12	5.7
1991	-2.03	-4.57	3.08	2.38	4.83	10.15	15.24	15.31	12.28	5.04	0.74	-2.71	-3.46	3.43	13.57	6.02	0.16	10.03	4.98
1992	-2.46	-1.44	1.33	3.65	10.05	10.81	14.38	16.19	10.35	3.94	3.24	-1.35	-2.2	5.01	13.79	5.85	0.08	10.9	5.72
1993	-0.04	-2.68	-0.13	5.04	9.56	12.09	12.41	13.84	8.84	4.77	-1.04	-0.5	-1.36	4.82	12.78	4.19	0.5	10.29	5.18
1994	-1.44	-1.94	4.33	2.42	8.72	12.17	16.56	15	9.73	6.18	4.74	0.11	-1.29	5.16	14.58	6.88	0.7	10.77	6.38
1995	-3.8	0.64	-1.15	4.28	8.05	9.86	16.08	13	7.63	9.4	0.68	-2.32	-1.02	3.73	12.98	5.9	1.12	9.82	5.2
1996	-1.27	-4.32	-1.1	4.62	8.01	12.67	12.82	12.41	7.08	5.83	0.96	-2.22	-2.64	3.84	12.63	4.62	0.18	9.6	4.62
1997	-2.26	0.4	3.08	3.08	8.8	11.13	12.23	14.97	11.98	6.04	1.76	-1.06	-1.36	4.99	12.78	6.59	0.96	10.37	5.85
1998	-1.65	1.01	0.95	3.38	9.5	12.56	14.22	14.39	9.44	5.63	-1.85	-2.05	-0.57	4.61	13.72	4.41	1.17	10.58	5.46
1999	-1.46	-4.18	1.36	3.7	10.37	10.79	14.32	13.76	12.23	6.46	-0.77	-2.12	-2.56	5.14	12.96	5.97	-0.42	10.86	5.37
2000	-3.4	-0.41	1.29	4.96	10.2	13.41	11.57	14.68	11.09	6.56	1.48	0.47	-1.98	5.48	13.22	6.38	0.17	10.98	5.99
2001	-2.06	-1.01	2.77	2.23	10.54	10.78	14.12	15.01	7.17	9.63	0.12	-3.81	-0.87	5.18	13.3	5.64	1.37	9.97	5.46
2002	-1.91	0.95	2.49	4.23	8.08	14.44	13.63	13.03	8.83	6.33	2.65	0.15	-1.59	4.94	13.7	5.94	1.25	10.37	6.08
2003	-3.79	-5.02	2.79	4.38	10.02	17.34	15.39	17.89	10.55	3.47	2.9	-1.1	-2.89	5.73	16.87	5.64	0.52	12.6	6.24
2004	-3	-1.66	-0.04	4.32	7.22	11.99	13.57	14.04	11.16	7.98	0.84	-1.69	-1.92	3.83	13.2	6.66	0.09	10.38	5.4
2005	-3.44	-5.88	0.67	4.44	9.14	13.75	13.95	11.98	11.27	7.91	0.4	-4.3	-3.67	4.75	13.23	6.52	-0.25	10.75	4.99
2006	-4.43	-3.38	-1.1	4.17	8.57	13.27	17.69	10.47	13.15	9.27	3.71	0.02	-4.04	3.88	13.81	8.71	-0.82	11.22	5.95
2007	0.39	0.96	1.31	8.96	9.71	12.67	13.43	12.9	8.93	5.98	-0.08	-2.28	0.46	6.66	13	4.94	2.61	11.1	6.07
2008	-0.18	0.3	-0.11	3.18	10.09	12.85	13.76	13.73	8.81	6.59	0.95	-2.51	-0.72	4.39	13.45	5.45	0.61	10.4	5.62
2009	-4.44	-3.42	0.01	6.31	10.83	11.98	14.38	15.72	11.72	6.07	3.39	-2.88	-3.46	5.72	14.03	7.06	-0.47	11.82	5.81
2010	-5.16	-3.33	-0.12	5.12	7.07	12.33	15.85	12.89	9.33	5.49	1.04	-4.28	-3.79	4.03	13.69	5.29	-0.34	10.43	4.69
2011	-2.43	-0.52	2.31	7.61	10.59	12.32	12.07	15.2	12.64	6.52	3.68	-0.52	-2.41	6.84	13.2	7.61	0.27	11.74	6.62
2012	-1.82	-6.48	3.72	4.08	9.41	13.29	13.98	15.54	10.66	6.84	2.73	-2.19	-2.94	5.73	14.27	6.74	0.85	11.16	5.81
2013	-2.68	-5.34	-0.77	4.87	6.23	11.5	15.99	14.42	10.96	7.95	0.52	-0.41	-3.4	3.44	13.97	6.48	-0.24	10.66	5.27
2014	-0.63	-0.43	2.79	6.12	7.7	13.14	13.33	12.1	11.19	8.78	4.34	-0.34	-0.49	5.54	12.86	8.1	1.63	10.6	6.51
2015	-1.65	-3.22	2.02	5.32	9.26	13.59	17.76	15.56	9.06	5.88	4.21	2.26	-1.74	5.53	15.63	6.38	1.65	11.76	6.67
2016	-1.1	-0.19	0.14	4.57	7.88	11.97	15.09	14.8	12.54	5.38	1.82	-0.11	0.32	4.19	13.95	6.58	1.87	11.14	6.07
2017	-5.15	0.46	4.11	4.42	9.8	15.18	15.05	15.45	8.65	7.78	0.88	-2.43	-1.6	6.11	15.23	5.77	1.09	11.43	6.18
2018	0.48	-5.21	-0.21	7.81	10.43	13.81	16.24	15.89	12.56	8.04	2.79	-0.11	-2.39	6.01	15.31	7.8	0.21	12.79	6.88
2019	-4.37	0.73	2.27	4.47	6.08	15.25	16.21	15.1	11.37	8.45	1.51	0.78	-1.25	4.27	15.52	7.11	1.56	11.42	6.49
2020	-0.28	1.62	1.53	7.62	9.53	11.82	15.4	15.2	11.87	5.36	3.69	-1.18	0.71	6.23	14.14	6.97	2.27	11.91	6.85
2021	-3.56	0.82	0.92	NaN	NaN	NaN	NaN	NaN	NaN	NaN	NaN	NaN	-1.31	NaN	NaN	NaN	1.01	NaN	NaN
];

    % Logical indexing to extract the desired range of data
    idx = find(data(:, 1) >= starting_year & data(:, 1) <= ending_year);
    idx=idx';
    
    idx_size=size(idx,2);

    y_coords(1,:)=data(idx(1),month_period:13);% set the 1° row of data
    y_coords(2:idx_size-1,:)=data(idx(2:idx_size-1),2:13); 
    y_coords(idx_size,:)=data(idx(idx_size),2:month_period); % set the last row of data
    
    y_coords(idx_size,month_period:12)=NaN; % set all unecessary cells to 'NaN'
    y_coords = reshape(y_coords', 1, [])'; % create a column vector
    
    y_coords=y_coords(1:find(isnan(y_coords))-1,1); % remode all the cells with 'NaN' value
    
    x_coords=(((1:numel(y_coords)))/12)'; % create the period 

end