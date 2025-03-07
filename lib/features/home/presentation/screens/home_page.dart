import 'package:dartssh2/dartssh2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lg_task_two/core/common/ssh_connection/presentation/ssh_client_cubit/ssh_clent_cubit.dart';
import 'package:lg_task_two/core/common/ssh_connection/presentation/widgets/connection_indicator.dart';
import 'package:lg_task_two/core/common/widgets/bottom_nav_bar.dart';
import 'package:lg_task_two/core/common/widgets/loader.dart';
import 'package:lg_task_two/core/constants/kml_constants.dart';
import 'package:lg_task_two/features/home/presentation/blocs/clean_kml/clean_kml_bloc.dart';
import 'package:lg_task_two/features/home/presentation/blocs/clean_lg_logo/clean_lg_logo_bloc.dart';
import 'package:lg_task_two/features/home/presentation/blocs/send_kml_bloc/send_kml_bloc.dart';
import 'package:lg_task_two/features/home/presentation/blocs/send_lg_logo/send_lg_logo_bloc.dart';
import 'package:lg_task_two/features/home/presentation/widgets/command_buttons.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Liquid Galaxy",
          style: Theme.of(context).textTheme.bodyLarge,
        ),
        actions: const [
          SSHConnectionIndicator(),
          SizedBox(width: 20),
        ],
      ),
      body: BlocBuilder<SSHClientCubit, SSHClientState>(
        builder: (context, state) {
          if (state is SSHClientSuccess) {
            final SSHClient client = state.sshClient;
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  "assets/images/lg_logo.png",
                  width: MediaQuery.of(context).size.width * 0.5,
                ),
                const SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Flexible(
                        child: BlocBuilder<SendLgLogoBloc, SendLgLogoState>(
                          builder: (context, state) {
                            if (state is SendLgLogoLoading) {
                              return const Loader();
                            }

                            return CommandButton(
                              buttonText: "View\nLG logo",
                              onPressed: () async {
                                context.read<SendLgLogoBloc>().add(
                                      SendLgLogo(client: client),
                                    );
                              },
                            );
                          },
                        ),
                      ),
                      const SizedBox(width: 20),
                      Flexible(
                        child: CommandButton(
                          buttonText: "Clean\n LG Logo",
                          onPressed: () {
                            context.read<CleanLgLogoBloc>().add(
                                  CleanLgLogo(
                                    client: client,
                                    numberOfRigs: 3,
                                  ),
                                );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Flexible(
                        child: CommandButton(
                          buttonText: "San\nFrancisco",
                          onPressed: () async {
                            String latitude = "37.7577000";
                            String longitude = "-122.4376000";

                            final command =
                                "echo 'search=$latitude,$longitude' > /tmp/query.txt";
                            await client.run(command);
                            final kmlContent = KmlConstants().sanFrancisco;
                            context.read<SendKmlBloc>().add(
                                  SendKml(
                                    client: client,
                                    kmlContent: kmlContent,
                                    kmlName: "master_1",
                                  ),
                                );
                          },
                        ),
                      ),
                      const SizedBox(width: 20),
                      Flexible(
                        child: CommandButton(
                          buttonText: "Clean\nKML",
                          onPressed: () {
                            context.read<CleanKmlBloc>().add(
                                  CleanKml(client: client),
                                );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Flexible(
                        child: CommandButton(
                          buttonText: "Eiffel\nTower",
                          onPressed: () async {
                            String latitude = "48.85840000000001";
                            String longitude = "2.2945";

                            final command =
                                "echo 'search=$latitude,$longitude' > /tmp/query.txt";
                            await client.run(command);
                            final kmlContent = KmlConstants().eiffelTower;
                            context.read<SendKmlBloc>().add(
                                  SendKml(
                                    client: client,
                                    kmlContent: kmlContent,
                                    kmlName: 'master_1',
                                  ),
                                );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            );
          }
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  "assets/images/undraw_dreamer_gb41.png",
                  width: 200,
                  height: 200,
                ),
                Text(
                  "You are not conect to any\nLiquid Galaxy Rig",
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.bodySmall,
                ),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (builder) => const BottomNavBar(
                          initialIndex: 1,
                        ),
                      ),
                    );
                  },
                  child: const Text("Connect"),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
